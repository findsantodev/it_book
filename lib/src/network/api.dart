import 'package:chopper/chopper.dart';
import 'package:palm_code/src/books/podo/books_response.dart';

part 'api.chopper.dart';

@ChopperApi()
abstract class Api extends ChopperService {
  static Api create([ChopperClient? client]) => _$Api(client);

  @Get(path: '/books/?page={page}')
  Future<Response<BooksResponse>> getBooks({
    @Path('page') String? page,
  });

  @Get(path: '/books/?ids={ids}')
  Future<Response<BooksResponse>> getFavoriteBooks({
    @Path('ids') String? ids,
  });

  @Get(path: '/books?topic=best%20book')
  Future<Response<BooksResponse>> getBestBooks();

  @Get(path: '/books{search}{topic}')
  Future<Response<BooksResponse>> filterBooks({
    @Path('search') String? searchKeyword,
    @Path('topic') String? topic,
  });

  @Get(path: '/books/{path}')
  Future<Response<BooksResponse>> getNextPageBooks({
    @Path('path') String? path,
  });
}
