import 'package:chopper/chopper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:palm_code/src/books/podo/books_response.dart';
import 'package:palm_code/src/favorite/favorite_store.dart';

import '../test_utils/mocks.mocks.dart';

void main() {
  final mockFavoriteRepo = MockFavoriteRepo();
  final mockNavigationService = MockNavigationService();
  final mockConnectionService = MockConnectionService();
  final favoriteBookIds = ["1", "2", "3"];

  FavoriteStore createFavoriteStore() {
    return FavoriteStore(
      favoriteRepo: mockFavoriteRepo,
      navigationService: mockNavigationService,
      connectionService: mockConnectionService,
    );
  }

  group('Initialization', () {
    setUp(() {});
    test('Create store', () async {
      final store = createFavoriteStore();
      expect(store, isA<FavoriteStore>());
    });

    test(
        'Initializes store '
        'Set favoriteState to loading', () async {
      final store = createFavoriteStore();

      store.init();

      expect(store.favoriteState, FavoriteState.loading);
    });
    test(
        'Initializes store '
        'await until all process done '
        'favoriteState is success', () async {
      final store = createFavoriteStore();

      when(mockConnectionService.hasInternet())
          .thenAnswer((_) => Future.value(true));

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
        mockFavoriteRepo.getFavoriteBooks(
          favoriteBookIds: anyNamed("favoriteBookIds"),
        ),
      ).thenAnswer(
        (_) => Future.value(
          Response<BooksResponse>(
            mockHttpResponse,
            BooksResponse(),
          ),
        ),
      );

      when(mockFavoriteRepo.getListOfFavoriteBookIdsFromLocal())
          .thenAnswer((realInvocation) => Future.value(favoriteBookIds));

      await store.init();

      expect(store.favoriteState, FavoriteState.success);
    });
  });
}
