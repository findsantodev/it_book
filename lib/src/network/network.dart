import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:logging/logging.dart' as log;
import 'package:palm_code/src/flavor/flavor.dart';
import 'package:palm_code/src/i18n/localization_store.dart';
import 'package:palm_code/src/log/log.dart';
import 'package:palm_code/src/network/api.dart';
import 'package:palm_code/src/network/built_value_converter.dart';
import 'package:palm_code/src/serializers/serializers.dart';

const String _contentTypeHeader = "application/json";

class Network {
  final FlavorConfig _flavorConfig;
  final LocalizationStore _localizationStore;

  Network({
    required FlavorConfig flavorConfig,
    required LocalizationStore localizationStore,
  })  : _flavorConfig = flavorConfig,
        _localizationStore = localizationStore;

  late ChopperClient chopper;
  Map<String, String>? headers;

  Api get api => chopper.getService<Api>();

  // Must be called before trying to call any other method
  Future init() async {
    _setupLogging();
    chopper = ChopperClient(
      baseUrl: Uri.parse(_flavorConfig.baseUrl),
      interceptors: [
        (Request request) async => applyHeader(
              request,
              HttpHeaders.contentTypeHeader,
              _contentTypeHeader,
            ),
        (Request request) async => applyHeader(
              request,
              HttpHeaders.acceptLanguageHeader,
              await _getLocalizationString(),
            ),
        HttpLoggingInterceptor(),
      ],
      converter: BuiltValueConverter(standardSerializers),
      services: [Api.create()],
    );
    return;
  }

  Future<String> _getLocalizationString() async {
    String locale = "";
    try {
      await _localizationStore.loadLocale();

      locale = _localizationStore.locale.languageCode;
    } catch (e) {
      locale = "";
    }

    return locale;
  }

  void _setupLogging() {
    log.Logger.root.level = log.Level.ALL; // defaults to Level.INFO
    log.Logger.root.onRecord.listen((rec) {
      Log.debug('Network', '${rec.level.name}: ${rec.time}: ${rec.message}');
    });
  }
}
