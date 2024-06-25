import 'package:meta/meta.dart';
import 'package:package_info/package_info.dart';

@visibleForTesting
const String productionBaseUrl = "http://gutendex.com";

enum Flavor { production }

class FlavorConfig {
  PackageInfo? _packageInfo;
  final Future<PackageInfo> _packageInfoFuture;

  FlavorConfig({
    required Future<PackageInfo> packageInfoFuture,
  }) : _packageInfoFuture = packageInfoFuture;

  // Must be called before trying to call any other method
  Future<void> init() async {
    _packageInfo = await _packageInfoFuture;
    return;
  }

  void _checkInit() {
    if (_packageInfo == null) {
      throw StateError(
        "FlavorConfig must be initialised before calling other methods. Please call and await on init().",
      );
    }
  }

  Flavor get flavor {
    _checkInit();
    return Flavor.production;
  }

  String get packageName {
    _checkInit();
    return _packageInfo!.packageName;
  }

  String get baseUrl {
    _checkInit();
    switch (flavor) {
      case Flavor.production:
        return productionBaseUrl;
      default:
        throw ArgumentError.value(
          flavor,
          "No flavor for",
          "Base URL resolution failed",
        );
    }
  }
}
