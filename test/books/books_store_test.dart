import 'package:chopper/chopper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:palm_code/src/books/books_store.dart';
import 'package:palm_code/src/books/podo/books_response.dart';
import 'package:palm_code/src/favorite/favorite_store.dart';

import '../test_utils/mocks.mocks.dart';

void main() {
  final mockBooksRepo = MockBooksRepo();
  final mockNavigationService = MockNavigationService();

  BooksStore createBooksStore() {
    return BooksStore(
      booksRepo: mockBooksRepo,
      navigationService: mockNavigationService,
    );
  }

  group('Initialization', () {
    setUp(() {});
    test('Create store', () async {
      final store = createBooksStore();
      expect(store, isA<FavoriteStore>());
    });

    test(
        'Initializes store '
        'await until all filter process done '
        'booksState is success', () async {
      final store = createBooksStore();

      void provideDummy<BooksResponse>(BooksResponse dummy) =>
          provideDummyBuilder((parent, invocation) => dummy);
      final mockHttpResponse = http.Response('mock response body', 200);

      provideDummy<Response<BooksResponse>>(
        Response<BooksResponse>(
          mockHttpResponse,
          BooksResponse(),
        ),
      );

      when(
        mockBooksRepo.filterBooks(
          searchKeyword: anyNamed("searchKeyword"),
          topic: anyNamed("topic"),
        ),
      ).thenAnswer(
        (_) => Future.value(
          Response<BooksResponse>(
            mockHttpResponse,
            BooksResponse(),
          ),
        ),
      );

      await store.filterBooks();

      expect(store.booksState, BooksState.success);
    });
    test(
        'Fetch next books page '
        'booksState is success', () async {
      final store = createBooksStore();

      void provideDummy<BooksResponse>(BooksResponse dummy) =>
          provideDummyBuilder((parent, invocation) => dummy);
      final mockHttpResponse = http.Response('mock response body', 200);

      provideDummy<Response<BooksResponse>>(
        Response<BooksResponse>(
          mockHttpResponse,
          BooksResponse(),
        ),
      );

      when(
        mockBooksRepo.getNextPageBooks(
          path: anyNamed("path"),
        ),
      ).thenAnswer(
        (_) => Future.value(
          Response<BooksResponse>(
            mockHttpResponse,
            BooksResponse(),
          ),
        ),
      );

      await store.fetchNextBooks(nextPath: "paths");

      expect(store.loadMoreBook, false);
    });
  });
}
