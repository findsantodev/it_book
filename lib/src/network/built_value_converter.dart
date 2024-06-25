import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:chopper/chopper.dart';

/// Copied from [here](https://github.com/lejard-h/chopper/blob/develop/chopper_built_value/lib/chopper_built_value.dart)
/// Can't use the chopper_built_value package as it depends on an older version
/// of built value.
class BuiltValueConverter implements Converter, ErrorConverter {
  final Serializers serializers;
  final JsonConverter jsonConverter = const JsonConverter();
  final Type? errorType;

  BuiltValueConverter(this.serializers, {this.errorType});

  T? _deserialize<T>(dynamic value) {
    Serializer<T?>? serializer;
    if (value is Map && value.containsKey('\$')) {
      serializer = serializers.serializerForWireName(value['\$'] as String)
          as Serializer<T?>?;
    }
    serializer ??= serializers.serializerForType(T) as Serializer<T?>?;

    if (serializer == null) {
      throw 'Serializer not found for $T';
    }

    return serializers.deserializeWith<T?>(serializer, value);
  }

  BuiltList<InnerType> _deserializeListOf<InnerType>(Iterable value) {
    final Iterable<InnerType?> deserialize =
        value.map((value) => _deserialize<InnerType>(value));
    return BuiltList<InnerType>(deserialize.toList(growable: false));
  }

  BodyType? deserialize<BodyType, InnerType>(dynamic entity) {
    if (entity is BodyType) return entity;
    if (entity is Iterable) {
      return _deserializeListOf<InnerType>(entity) as BodyType;
    }
    return _deserialize<BodyType>(entity);
  }

  @override
  Request convertRequest(Request request) {
    return jsonConverter.convertRequest(
      request.copyWith(body: serializers.serialize(request.body)),
    );
  }

  @override
  Future<Response<BodyType>> convertResponse<BodyType, InnerType>(
    Response response,
  ) async {
    final jsonResponse = await jsonConverter.convertResponse(response);
    final body = deserialize<BodyType, InnerType>(jsonResponse.body);
    return jsonResponse.copyWith(body: body);
  }

  @override
  Future<Response> convertError<BodyType, InnerType>(Response response) async {
    final jsonResponse = await jsonConverter.convertResponse(response);

    dynamic body;

    try {
      // try to deserialize using wireName
      body ??= _deserialize(jsonResponse.body);
    } catch (_) {
      // or check provided error type
      if (errorType != null) {
        final serializer = serializers.serializerForType(errorType!)!;
        body = serializers.deserializeWith(serializer, jsonResponse.body);
      }
      body ??= jsonResponse.body;
    }

    return jsonResponse.copyWith(body: body);
  }
}
