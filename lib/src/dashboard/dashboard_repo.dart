import 'package:chopper/chopper.dart';
import 'package:palm_code/src/books/podo/book_item.dart';
import 'package:palm_code/src/books/podo/books_response.dart';

import 'package:palm_code/src/network/network.dart';
import 'package:palm_code/src/repo/shared_preferences_repo.dart';

class DashboardRepo {
  final Network _network;

  DashboardRepo({
    required Network network,
  }) : _network = network;

  Future<Response<BooksResponse>> getBooks({String? page}) {
    return _network.api.getBooks(page: page ?? "1");
  }

  Future<Response<BooksResponse>> getBestBooks() {
    return _network.api.getBestBooks();
  }

  Future setFavoriteBooksToLocal({
    required List<BookItem> listOfBooks,
    required String key,
  }) async {
    final listOfJSONBooks = listOfBooks.map((e) => e.toJson()).toList();

    return SharedPreferencesRepo.instance
        .saveFavoriteBooks(listOfJSONBooks, key);
  }

  Future<List<BookItem?>> getFavoriteBooksFromLocal({
    required String key,
  }) async {
    final listOfJSONBooks =
        await SharedPreferencesRepo.instance.getFavoriteBooks(key);
    return listOfJSONBooks.map((e) => BookItem.fromJson(e)).toList();
  }
}
