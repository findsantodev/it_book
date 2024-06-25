import 'package:get_it/get_it.dart';
import 'package:package_info/package_info.dart';
import 'package:palm_code/src/books/books_repo.dart';
import 'package:palm_code/src/books/books_store.dart';
import 'package:palm_code/src/flavor/flavor.dart';
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
}
