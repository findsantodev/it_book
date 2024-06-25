import 'package:mobx/mobx.dart';
import 'package:palm_code/src/books/books_repo.dart';
import 'package:palm_code/src/books/podo/book_item.dart';
import 'package:palm_code/src/log/log.dart';
import 'package:palm_code/src/navigation/navigation_service.dart';

part 'books_store.g.dart';

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
  List<BooksItem>? listOfBooks;

  @action
  Future fetchBooks() async {
    try {
      final response = await _booksRepo.getBooks();

      Log.debug("BooksStore", response.toString());

      // HTTP level error
      if (!response.isSuccessful) {
        booksErrorMessage = "Unable to fetch books data : ${response.error}";
        booksState = BooksState.error;
        Log.debug("BooksStore", "${response.error}");
      }

      // Application level error
      else if (response.body!.detail != null) {
        booksErrorMessage = "${response.body!.detail}";
        booksState = BooksState.error;
        Log.debug("BooksStore", response.body!.detail);
      } else {
        if (response.body?.results != null) {
          listOfBooks = response.body?.results?.toList();
        }
        Log.debug("BooksStore", response.body!.toString());

        booksState = BooksState.success;
      }
      // Exception caused by network, parsing or other unhandled cases
    } catch (e, stacktrace) {
      booksErrorMessage = "Unable to fetch books data : $e";
      booksState = BooksState.error;
      Log.debug("BooksStore", e.toString(), e, stacktrace);
    }
  }
}
