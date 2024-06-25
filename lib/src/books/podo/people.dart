import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:palm_code/src/serializers/serializers.dart';

part 'people.g.dart';

abstract class People implements Built<People, PeopleBuilder> {
  factory People([void Function(PeopleBuilder)? updates]) = _$People;
  @BuiltValueField(wireName: "name")
  String? get name;

  @BuiltValueField(wireName: "birth_year")
  int? get birthYear;

  @BuiltValueField(wireName: "death_year")
  int? get deathYear;

  People._();

  static Serializer<People> get serializer => _$peopleSerializer;

  static People? fromJson(Map<String, dynamic> jsonMap) {
    return standardSerializers.deserializeWith(
      People.serializer,
      jsonMap,
    );
  }
}
