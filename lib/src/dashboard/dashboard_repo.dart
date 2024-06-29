import 'package:chopper/chopper.dart';
import 'package:palm_code/src/books/podo/books_response.dart';

import 'package:palm_code/src/network/network.dart';

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
}
