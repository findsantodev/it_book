import 'package:mobx/mobx.dart';
import 'package:palm_code/src/books/books_repo.dart';
import 'package:palm_code/src/books/podo/book_item.dart';
import 'package:palm_code/src/log/log.dart';
import 'package:palm_code/src/navigation/navigation_service.dart';

part 'books_store.g.dart';

enum BooksDashboardFilter { popular, best, search }

enum BooksState { loading, success, error }

class BooksStore = _BooksStore with _$BooksStore;

abstract class _BooksStore with Store {
  final BooksRepo _booksRepo;
  final NavigationService _navigationService;
  _BooksStore({
    required BooksRepo booksRepo,
    required NavigationService navigationService,
  })  : _booksRepo = booksRepo,
        _navigationService = navigationService;

  @observable
  BooksState booksState = BooksState.loading;

  @observable
  String booksErrorMessage = "";

  @observable
  late List<BookItem> listOfBook = [];

  @observable
  String nextBooksPage = "";

  @observable
  bool loadMoreBook = false;

  @observable
  bool focusOnnSearchBook = false;

  @action
  Future fetchNextBooks({required String nextPath}) async {
    try {
      final response = await _booksRepo.getNextPageBooks(path: nextPath);

      Log.debug("BooksStore", response.toString());

      // HTTP level error
      if (!response.isSuccessful) {
        booksErrorMessage = "${response.error}";
        Log.debug("BooksStore", "${response.error}");
        throw booksErrorMessage;
      }

      // Application level error
      else if (response.body!.detail != null) {
        booksErrorMessage = "${response.body!.detail}";
        Log.debug("BooksStore", response.body!.detail);
        throw booksErrorMessage;
      } else {
        if (response.body?.results != null) {
          listOfBook = listOfBook
            ..addAll(response.body?.results?.toList() ?? []);
          nextBooksPage = response.body?.next ?? "";
        }

        Log.debug("BooksStore", response.body!.toString());
      }
      // Exception caused by network, parsing or other unhandled cases
    } catch (e, stacktrace) {
      booksErrorMessage = "Unable to fetch books data : $e";
      Log.debug("BooksStore", e.toString(), e, stacktrace);
    }
  }

  @action
  Future filterBooks({String? keywords, String? topic}) async {
    booksState = BooksState.loading;

    try {
      final response =
          await _booksRepo.filterBooks(searchKeyword: keywords, topic: topic);

      Log.debug("BooksStore", response.toString());

      // HTTP level error
      if (!response.isSuccessful) {
        booksErrorMessage = "${response.error}";
        booksState = BooksState.error;
        Log.debug("BooksStore", "${response.error}");
        throw booksErrorMessage;
      }

      // Application level error
      else if (response.body!.detail != null) {
        booksErrorMessage = "${response.body!.detail}";
        booksState = BooksState.error;
        Log.debug("BooksStore", response.body!.detail);
        throw booksErrorMessage;
      } else {
        if (response.body?.results != null) {
          listOfBook = response.body?.results?.toList() ?? [];
          nextBooksPage = response.body?.next ?? "";
        }
        booksState = BooksState.success;
        Log.debug("BooksStore", response.body!.toString());
      }
      // Exception caused by network, parsing or other unhandled cases
    } catch (e, stacktrace) {
      booksErrorMessage = "Unable to fetch filtered book data : $e";
      booksState = BooksState.error;
      Log.debug("BooksStore", e.toString(), e, stacktrace);
    }
  }

  @action
  Future checkMoreBooks() async {
    if (nextBooksPage != '' && !loadMoreBook) {
      loadMoreBook = true;
      final path = nextBooksPage.replaceAll("http://gutendex.com/books/", "");
      await fetchNextBooks(nextPath: path);
      loadMoreBook = false;
    }
  }

  void navigateToBookDetail(BookItem _bookItem) {
    _navigationService.push(
      NavigationService.routeBookDetail,
      arguments: _bookItem,
    );
  }
}
