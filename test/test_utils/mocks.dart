import 'package:mockito/annotations.dart';
import 'package:package_info/package_info.dart';
import 'package:palm_code/src/books/books_repo.dart';
import 'package:palm_code/src/books/books_store.dart';
import 'package:palm_code/src/connection/connection.dart';
import 'package:palm_code/src/dashboard/dashboard_repo.dart';
import 'package:palm_code/src/dashboard/dashboard_store.dart';
import 'package:palm_code/src/favorite/favorite_repo.dart';
import 'package:palm_code/src/favorite/favorite_store.dart';
import 'package:palm_code/src/home/home_store.dart';
import 'package:palm_code/src/i18n/localization_store.dart';
import 'package:palm_code/src/navigation/navigation_service.dart';
import 'package:palm_code/src/network/api.dart';
import 'package:palm_code/src/network/network.dart';
import 'package:palm_code/src/repo/shared_preferences_repo.dart';

@GenerateMocks(
  [
    // Stores
    DashboardStore,
    FavoriteStore,
    BooksStore,
    HomeStore, LocalizationStore,
    // Configs
    PackageInfo,
    // Repos
    DashboardRepo,
    FavoriteRepo,
    BooksRepo,
    SharedPreferencesRepo,
    // Services
    NavigationService,
    ConnectionService,
    Network,
    Api,
  ],
  customMocks: [],
)
class Mock {}
