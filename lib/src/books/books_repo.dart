import 'package:chopper/chopper.dart';
import 'package:palm_code/src/books/podo/books_response.dart';

import 'package:palm_code/src/network/network.dart';

class BooksRepo {
  final Network _network;

  BooksRepo({
    required Network network,
  }) : _network = network;

  Future<Response<BooksResponse>> getBooks() {
    return _network.api.getBooks();
  }
}
