import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

extension SerializersExtension on Serializers {
  Serializers withJsonPlugin() {
    return (toBuilder()..addPlugin(StandardJsonPlugin())).build();
  }
}
