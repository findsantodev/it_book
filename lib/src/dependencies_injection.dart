import 'package:get_it/get_it.dart';
import 'package:package_info/package_info.dart';
import 'package:palm_code/src/books/books_repo.dart';
import 'package:palm_code/src/books/books_store.dart';
import 'package:palm_code/src/connection/connection.dart';
import 'package:palm_code/src/dashboard/dashboard_repo.dart';
import 'package:palm_code/src/dashboard/dashboard_store.dart';
import 'package:palm_code/src/favorite/favorite_repo.dart';
import 'package:palm_code/src/favorite/favorite_store.dart';
import 'package:palm_code/src/flavor/flavor.dart';
import 'package:palm_code/src/home/home_store.dart';
import 'package:palm_code/src/i18n/localization_store.dart';
import 'package:palm_code/src/navigation/navigation_service.dart';
import 'package:palm_code/src/network/network.dart';
import 'package:palm_code/src/splash/splash_store.dart';

void setUpDI() {
  GetIt.instance.registerSingleton(PackageInfo.fromPlatform());
  GetIt.instance.registerSingleton<FlavorConfig>(
    FlavorConfig(packageInfoFuture: GetIt.instance.get<Future<PackageInfo>>()),
  );
  GetIt.instance.registerSingleton(LocalizationStore());
  GetIt.instance.registerSingleton(NavigationService());
  GetIt.instance.registerSingleton(const ConnectionService());
  GetIt.instance.registerSingleton(
    Network(
      flavorConfig: GetIt.instance.get<FlavorConfig>(),
      localizationStore: GetIt.instance.get<LocalizationStore>(),
    ),
  );
  GetIt.instance.registerFactory(
    () => SplashStore(
      localizationStore: GetIt.instance.get<LocalizationStore>(),
      navigationService: GetIt.instance.get<NavigationService>(),
      flavorConfig: GetIt.instance.get<FlavorConfig>(),
      network: GetIt.instance.get<Network>(),
    ),
  );
  GetIt.instance.registerSingleton(
    HomeStore(
      navigationService: GetIt.instance.get<NavigationService>(),
    ),
  );
  GetIt.instance.registerFactory(
    () => BooksRepo(
      network: GetIt.instance.get<Network>(),
    ),
  );
  GetIt.instance.registerFactory(
    () => BooksStore(
      booksRepo: GetIt.instance.get<BooksRepo>(),
      navigationService: GetIt.instance.get<NavigationService>(),
    ),
  );
  GetIt.instance.registerFactory(
    () => DashboardRepo(
      network: GetIt.instance.get<Network>(),
    ),
  );
  GetIt.instance.registerSingleton(
    DashboardStore(
      dashboardRepo: GetIt.instance.get<DashboardRepo>(),
      navigationService: GetIt.instance.get<NavigationService>(),
    ),
  );
  GetIt.instance.registerFactory(
    () => FavoriteRepo(
      network: GetIt.instance.get<Network>(),
    ),
  );
  GetIt.instance.registerFactory(
    () => FavoriteStore(
      favoriteRepo: GetIt.instance.get<FavoriteRepo>(),
      navigationService: GetIt.instance.get<NavigationService>(),
      connectionService: GetIt.instance.get<ConnectionService>(),
    ),
  );
}
