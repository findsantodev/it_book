import 'package:mobx/mobx.dart';
import 'package:palm_code/src/flavor/flavor.dart';
import 'package:palm_code/src/i18n/localization_store.dart';
import 'package:palm_code/src/navigation/navigation_service.dart';
import 'package:palm_code/src/network/network.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStore with _$SplashStore;

abstract class _SplashStore with Store {
  final LocalizationStore _localizationStore;
  final NavigationService _navigationService;
  final FlavorConfig _flavorConfig;
  final Network _network;
  _SplashStore({
    required LocalizationStore localizationStore,
    required NavigationService navigationService,
    required FlavorConfig flavorConfig,
    required Network network,
  })  : _localizationStore = localizationStore,
        _navigationService = navigationService,
        _flavorConfig = flavorConfig,
        _network = network;

  @observable
  bool isLoading = true;

  @observable
  String errorMessage = "";

  Future initApp() async {
    isLoading = true;

    final localeFuture = _localizationStore.loadLocale();
    final flavorFuture = _flavorConfig.init().then((_) async {
      return _network.init();
    });
    // Initialize necessary components
    final initialFuturesResult = await Future.wait(
      [
        localeFuture,
        flavorFuture,
        Future.delayed(const Duration(seconds: 2)),
      ],
    );

    _navigateToHome();

    return;
  }

  @action
  void onRetryClicked() {
    initApp();
  }

  void _navigateToHome() {
    _navigationService.pushReplacement(NavigationService.routeHome);
  }
}
