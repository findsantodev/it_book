import 'package:chopper/chopper.dart';
import 'package:palm_code/src/books/podo/books_response.dart';

import 'package:palm_code/src/network/network.dart';
import 'package:palm_code/src/repo/shared_preferences_repo.dart';

class BooksRepo {
  final Network _network;

  BooksRepo({
    required Network network,
  }) : _network = network;

  Future<Response<BooksResponse>> getNextPageBooks({String? path}) {
    return _network.api.getNextPageBooks(path: path);
  }

  Future<Response<BooksResponse>> filterBooks({
    String? searchKeyword,
    String? topic,
  }) {
    return _network.api.filterBooks(
      searchKeyword: searchKeyword != null ? "?search=$searchKeyword" : "",
      topic: topic != null ? "?topic=$topic" : "",
    );
  }

  Future<List<String>> getListOfFavoriteBookFromLocal() async {
    return SharedPreferencesRepo.instance.getFavoriteBooksIds();
  }

  Future<void> saveFavoriteBookToLocal(List<String> bookIds) async {
    return SharedPreferencesRepo.instance.saveFavoriteBooksIds(bookIds);
  }
}
