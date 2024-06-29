import 'package:chopper/chopper.dart';
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

  Future<List<String>> getListOfFavoriteBookFromLocal() async {
    return SharedPreferencesRepo.instance.getFavoriteBooks();
  }

  Future<void> saveFavoriteBookToLocal(List<String> bookIds) async {
    return SharedPreferencesRepo.instance.saveFavoriteBooks(bookIds);
  }
}
