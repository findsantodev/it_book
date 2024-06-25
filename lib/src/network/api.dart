import 'package:chopper/chopper.dart';
import 'package:palm_code/src/books/podo/books_response.dart';

part 'api.chopper.dart';

@ChopperApi()
abstract class Api extends ChopperService {
  static Api create([ChopperClient? client]) => _$Api(client);

  @Get(path: '/books')
  Future<Response<BooksResponse>> getBooks();
}
