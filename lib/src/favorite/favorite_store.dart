import 'package:mobx/mobx.dart';
import 'package:palm_code/src/books/podo/book_item.dart';
import 'package:palm_code/src/connection/connection.dart';
import 'package:palm_code/src/favorite/favorite_repo.dart';
import 'package:palm_code/src/log/log.dart';
import 'package:palm_code/src/navigation/navigation_service.dart';

part 'favorite_store.g.dart';

enum FavoriteState { loading, success, error }

class FavoriteStore = _FavoriteStore with _$FavoriteStore;

abstract class _FavoriteStore with Store {
  final FavoriteRepo _favoriteRepo;
  final NavigationService _navigationService;
  final ConnectionService _connectionService;
  _FavoriteStore({
    required FavoriteRepo favoriteRepo,
    required NavigationService navigationService,
    required ConnectionService connectionService,
  })  : _favoriteRepo = favoriteRepo,
        _navigationService = navigationService,
        _connectionService = connectionService;

  @observable
  FavoriteState favoriteState = FavoriteState.loading;

  @observable
  String favoriteErrorMessage = "";

  @observable
  late List<BookItem> listOfFavoriteBook = [];

  @observable
  late List<String> listOfFavoriteBookId = [];

  @observable
  bool loadMoreBook = false;

  @action
  Future init() async {
    favoriteState = FavoriteState.loading;
    try {
      await fetchFavoriteBooksFromLocal();
      await fetchFavoriteBooks();

      favoriteState = FavoriteState.success;
    } catch (e, stacktrace) {
      favoriteErrorMessage = "Unable to fetch favorite data : $e";
      favoriteState = FavoriteState.error;
      Log.debug("FavoriteStore", e.toString(), e, stacktrace);
    }
  }

  @action
  Future fetchFavoriteBooks() async {
    if (listOfFavoriteBookId.isNotEmpty) {
      if (await _connectionService.hasInternet()) {
        try {
          final response = await _favoriteRepo.getFavoriteBooks(
            favoriteBookIds: listOfFavoriteBookId.join(','),
          );

          Log.debug("FavoriteStore", response.toString());

          // HTTP level error
          if (!response.isSuccessful) {
            favoriteErrorMessage = "${response.error}";
            Log.debug("FavoriteStore", "${response.error}");
            throw favoriteErrorMessage;
          }

          // Application level error
          else if (response.body!.detail != null) {
            favoriteErrorMessage = "${response.body!.detail}";
            Log.debug("FavoriteStore", response.body!.detail);
            throw favoriteErrorMessage;
          } else {
            if (response.body?.results != null) {
              listOfFavoriteBook = response.body?.results?.toList() ?? [];
            }

            Log.debug("FavoriteStore", response.body!.toString());
          }
          // Exception caused by network, parsing or other unhandled cases
        } catch (e, stacktrace) {
          favoriteErrorMessage = "Unable to fetch favorite data : $e";
          Log.debug("FavoriteStore", e.toString(), e, stacktrace);
        }
      } else {}
    }
  }

  @action
  Future fetchFavoriteBooksFromLocal() async {
    try {
      final result = await _favoriteRepo.getListOfFavoriteBookFromLocal();
      listOfFavoriteBookId = result;
      Log.debug("FavoriteStore", "Lenght of favorite book: ${result.length}");
    } catch (e, stacktrace) {
      favoriteErrorMessage = "Unable to fetch favorite data : $e";
      Log.debug("FavoriteStore", e.toString(), e, stacktrace);
    }
  }

  @action
  Future addBookToFavorite(String bookId) async {
    listOfFavoriteBookId = listOfFavoriteBookId..add(bookId);
    Log.debug("FavoriteStore", "Add book with id $bookId to favorite");
    await _favoriteRepo.saveFavoriteBookToLocal(listOfFavoriteBookId);
    await fetchFavoriteBooksFromLocal();
    Log.debug(
      "FavoriteStore",
      "Lenght of favorite book: $listOfFavoriteBookId",
    );
  }

  @action
  Future removeBookToFavorite(String bookId) async {
    listOfFavoriteBookId = listOfFavoriteBookId..remove(bookId);
    Log.debug("FavoriteStore", "Remove book with id $bookId from favorite");
    await _favoriteRepo.saveFavoriteBookToLocal(listOfFavoriteBookId);
    await fetchFavoriteBooksFromLocal();
  }

  void navigateToBookDetail(BookItem _bookItem) {
    _navigationService.push(
      NavigationService.routeBookDetail,
      arguments: _bookItem,
    );
  }
}
