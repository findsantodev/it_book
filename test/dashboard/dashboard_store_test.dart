import 'package:chopper/chopper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:palm_code/src/books/podo/books_response.dart';
import 'package:palm_code/src/dashboard/dashboard_store.dart';
import 'package:palm_code/src/favorite/favorite_store.dart';

import '../test_utils/mocks.mocks.dart';

void main() {
  final mockDashboardRepo = MockDashboardRepo();
  final mockNavigationService = MockNavigationService();
  final mockConnectionService = MockConnectionService();

  DashboardStore createDashboardStore() {
    return DashboardStore(
      dashboardRepo: mockDashboardRepo,
      navigationService: mockNavigationService,
      connectionService: mockConnectionService,
    );
  }

  group('Initialization', () {
    setUp(() {});
    test('Create store', () async {
      final store = createDashboardStore();
      expect(store, isA<FavoriteStore>());
    });

    test(
        'Initializes store '
        'await until all process done '
        'booksState is success', () async {
      final store = createDashboardStore();

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
        mockConnectionService.hasInternet(),
      ).thenAnswer((realInvocation) => Future.value(true));
      when(
        mockDashboardRepo.setFavoriteBooksToLocal(
          listOfBooks: anyNamed("listOfBooks"),
          key: anyNamed("key"),
        ),
      ).thenAnswer((realInvocation) => Future.value());

      when(
        mockDashboardRepo.getBooks(
          page: anyNamed("page"),
        ),
      ).thenAnswer(
        (_) => Future.value(
          Response<BooksResponse>(
            mockHttpResponse,
            BooksResponse(),
          ),
        ),
      );
      when(
        mockDashboardRepo.getBestBooks(),
      ).thenAnswer(
        (_) => Future.value(
          Response<BooksResponse>(
            mockHttpResponse,
            BooksResponse(),
          ),
        ),
      );

      await store.init();

      expect(store.dashboardState, DashboardState.success);
    });
  });
}
