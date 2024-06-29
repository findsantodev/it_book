import 'package:mobx/mobx.dart';
import 'package:palm_code/src/books/books_store.dart';
import 'package:palm_code/src/books/podo/book_item.dart';
import 'package:palm_code/src/dashboard/dashboard_repo.dart';
import 'package:palm_code/src/log/log.dart';
import 'package:palm_code/src/navigation/navigation_service.dart';

part 'dashboard_store.g.dart';

enum DashboardState { loading, success, error }

class DashboardStore = _DashboardStore with _$DashboardStore;

abstract class _DashboardStore with Store {
  final DashboardRepo _dashboardRepo;
  final NavigationService _navigationService;
  _DashboardStore({
    required DashboardRepo dashboardRepo,
    required NavigationService navigationService,
  })  : _dashboardRepo = dashboardRepo,
        _navigationService = navigationService;

  @observable
  DashboardState dashboardState = DashboardState.loading;

  @observable
  String dashboardErrorMessage = "";

  @observable
  late List<BookItem> listOfPopularBook = [];

  @observable
  late List<BookItem> listOfBestBook = [];

  @action
  Future init() async {
    dashboardState = DashboardState.loading;
    try {
      if (listOfPopularBook.isEmpty || listOfBestBook.isEmpty) {
        await Future.wait([
          fetchPopularBook(),
          fetchBestBook(),
        ]);
      }
      dashboardState = DashboardState.success;
    } catch (e, stacktrace) {
      dashboardErrorMessage = "Unable to fetch dashboard data : $e";
      dashboardState = DashboardState.error;
      Log.debug("DashboardStore", e.toString(), e, stacktrace);
    }
  }

  @action
  Future fetchPopularBook({String? page}) async {
    try {
      final response = await _dashboardRepo.getBooks(page: page);

      Log.debug("DashboardStore", response.toString());

      // HTTP level error
      if (!response.isSuccessful) {
        dashboardErrorMessage = "${response.error}";
        Log.debug("DashboardStore", "${response.error}");
        throw dashboardErrorMessage;
      }

      // Application level error
      else if (response.body!.detail != null) {
        dashboardErrorMessage = "${response.body!.detail}";
        Log.debug("DashboardStore", response.body!.detail);
        throw dashboardErrorMessage;
      } else {
        if (response.body?.results != null) {
          listOfPopularBook = listOfPopularBook
            ..addAll(response.body?.results?.toList() ?? []);
        }

        Log.debug("DashboardStore", response.body!.toString());
      }
      // Exception caused by network, parsing or other unhandled cases
    } catch (e, stacktrace) {
      dashboardErrorMessage = "Unable to fetch pupolar book data : $e";
      Log.debug("DashboardStore", e.toString(), e, stacktrace);
    }
  }

  @action
  Future fetchBestBook() async {
    try {
      final response = await _dashboardRepo.getBestBooks();

      Log.debug("DashboardStore", response.toString());

      // HTTP level error
      if (!response.isSuccessful) {
        dashboardErrorMessage = "${response.error}";
        Log.debug("DashboardStore", "${response.error}");
        throw dashboardErrorMessage;
      }

      // Application level error
      else if (response.body!.detail != null) {
        dashboardErrorMessage = "${response.body!.detail}";
        Log.debug("DashboardStore", response.body!.detail);
        throw dashboardErrorMessage;
      } else {
        if (response.body?.results != null) {
          listOfBestBook = listOfBestBook
            ..addAll(response.body?.results?.toList() ?? []);
        }

        Log.debug("DashboardStore", response.body!.toString());
      }
      // Exception caused by network, parsing or other unhandled cases
    } catch (e, stacktrace) {
      dashboardErrorMessage = "Unable to fetch best book data : $e";
      Log.debug("DashboardStore", e.toString(), e, stacktrace);
    }
  }

  void navigateToBookDetail(BookItem _bookItem) {
    _navigationService.push(
      NavigationService.routeBookDetail,
      arguments: _bookItem,
    );
  }

  void navigateToBooks(BooksDashboardFilter dashboardFilter) {
    _navigationService.push(
      NavigationService.routeBooks,
      arguments: dashboardFilter,
    );
  }
}
