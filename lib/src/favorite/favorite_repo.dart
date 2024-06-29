import 'package:chopper/chopper.dart';
import 'package:palm_code/resources/constanst/shared_preference_constanst.dart';
import 'package:palm_code/src/books/podo/book_item.dart';
import 'package:palm_code/src/books/podo/books_response.dart';

import 'package:palm_code/src/network/network.dart';
import 'package:palm_code/src/repo/shared_preferences_repo.dart';

class FavoriteRepo {
  final Network _network;

  FavoriteRepo({
    required Network network,
  }) : _network = network;

  Future<Response<BooksResponse>> getFavoriteBooks({
    required String favoriteBookIds,
  }) {
    return _network.api.getFavoriteBooks(ids: favoriteBookIds);
  }

  Future<List<String>> getListOfFavoriteBookIdsFromLocal() async {
    return SharedPreferencesRepo.instance.getFavoriteBooksIds();
  }

  Future<void> saveFavoriteBookIdsToLocal(List<String> bookIds) async {
    return SharedPreferencesRepo.instance.saveFavoriteBooksIds(bookIds);
  }

  Future setFavoriteBooksToLocal({
    required List<BookItem> listOfBooks,
  }) async {
    final listOfJSONBooks = listOfBooks.map((e) => e.toJson()).toList();

    return SharedPreferencesRepo.instance
        .saveFavoriteBooks(listOfJSONBooks, favoriteBooksKey);
  }

  Future<List<BookItem?>> getFavoriteBooksFromLocal() async {
    final listOfJSONBooks =
        await SharedPreferencesRepo.instance.getFavoriteBooks(favoriteBooksKey);
    return listOfJSONBooks.map((e) => BookItem.fromJson(e)).toList();
  }
}
