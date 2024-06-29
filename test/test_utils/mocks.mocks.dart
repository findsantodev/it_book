// Mocks generated by Mockito 5.4.2 from annotations
// in palm_code/test/test_utils/mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i9;
import 'dart:ui' as _i3;

import 'package:chopper/chopper.dart' as _i16;
import 'package:flutter/material.dart' as _i5;
import 'package:mobx/mobx.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i18;
import 'package:package_info/package_info.dart' as _i14;
import 'package:palm_code/resources/l10n/app_localizations.dart' as _i4;
import 'package:palm_code/src/books/books_repo.dart' as _i20;
import 'package:palm_code/src/books/books_store.dart' as _i10;
import 'package:palm_code/src/books/podo/book_item.dart' as _i8;
import 'package:palm_code/src/books/podo/books_response.dart' as _i17;
import 'package:palm_code/src/connection/connection.dart' as _i23;
import 'package:palm_code/src/dashboard/dashboard_repo.dart' as _i15;
import 'package:palm_code/src/dashboard/dashboard_store.dart' as _i7;
import 'package:palm_code/src/favorite/favorite_repo.dart' as _i19;
import 'package:palm_code/src/favorite/favorite_store.dart' as _i11;
import 'package:palm_code/src/home/home_store.dart' as _i12;
import 'package:palm_code/src/i18n/localization_store.dart' as _i13;
import 'package:palm_code/src/navigation/navigation_service.dart' as _i22;
import 'package:palm_code/src/network/api.dart' as _i6;
import 'package:palm_code/src/network/network.dart' as _i24;
import 'package:palm_code/src/repo/shared_preferences_repo.dart' as _i21;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeReactiveContext_0 extends _i1.SmartFake
    implements _i2.ReactiveContext {
  _FakeReactiveContext_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLocale_1 extends _i1.SmartFake implements _i3.Locale {
  _FakeLocale_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAppLocalizations_2 extends _i1.SmartFake
    implements _i4.AppLocalizations {
  _FakeAppLocalizations_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGlobalKey_3<T extends _i5.State<_i5.StatefulWidget>>
    extends _i1.SmartFake implements _i5.GlobalKey<T> {
  _FakeGlobalKey_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRoute_4<T> extends _i1.SmartFake implements _i5.Route<T> {
  _FakeRoute_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeApi_5 extends _i1.SmartFake implements _i6.Api {
  _FakeApi_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeType_6 extends _i1.SmartFake implements Type {
  _FakeType_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [DashboardStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockDashboardStore extends _i1.Mock implements _i7.DashboardStore {
  MockDashboardStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.DashboardState get dashboardState => (super.noSuchMethod(
        Invocation.getter(#dashboardState),
        returnValue: _i7.DashboardState.loading,
      ) as _i7.DashboardState);

  @override
  set dashboardState(_i7.DashboardState? value) => super.noSuchMethod(
        Invocation.setter(
          #dashboardState,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get dashboardErrorMessage => (super.noSuchMethod(
        Invocation.getter(#dashboardErrorMessage),
        returnValue: '',
      ) as String);

  @override
  set dashboardErrorMessage(String? value) => super.noSuchMethod(
        Invocation.setter(
          #dashboardErrorMessage,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<_i8.BookItem> get listOfPopularBook => (super.noSuchMethod(
        Invocation.getter(#listOfPopularBook),
        returnValue: <_i8.BookItem>[],
      ) as List<_i8.BookItem>);

  @override
  set listOfPopularBook(List<_i8.BookItem>? value) => super.noSuchMethod(
        Invocation.setter(
          #listOfPopularBook,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<_i8.BookItem> get listOfBestBook => (super.noSuchMethod(
        Invocation.getter(#listOfBestBook),
        returnValue: <_i8.BookItem>[],
      ) as List<_i8.BookItem>);

  @override
  set listOfBestBook(List<_i8.BookItem>? value) => super.noSuchMethod(
        Invocation.setter(
          #listOfBestBook,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i2.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_0(
          this,
          Invocation.getter(#context),
        ),
      ) as _i2.ReactiveContext);

  @override
  _i9.Future<dynamic> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);

  @override
  _i9.Future<dynamic> fetchPopularBook({String? page}) => (super.noSuchMethod(
        Invocation.method(
          #fetchPopularBook,
          [],
          {#page: page},
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);

  @override
  _i9.Future<dynamic> fetchBestBook() => (super.noSuchMethod(
        Invocation.method(
          #fetchBestBook,
          [],
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);

  @override
  void navigateToBookDetail(_i8.BookItem? _bookItem) => super.noSuchMethod(
        Invocation.method(
          #navigateToBookDetail,
          [_bookItem],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i9.Future<dynamic> navigateToBooks(
          _i10.BooksDashboardFilter? dashboardFilter) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateToBooks,
          [dashboardFilter],
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);
}

/// A class which mocks [FavoriteStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockFavoriteStore extends _i1.Mock implements _i11.FavoriteStore {
  MockFavoriteStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.FavoriteState get favoriteState => (super.noSuchMethod(
        Invocation.getter(#favoriteState),
        returnValue: _i11.FavoriteState.loading,
      ) as _i11.FavoriteState);

  @override
  set favoriteState(_i11.FavoriteState? value) => super.noSuchMethod(
        Invocation.setter(
          #favoriteState,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get favoriteErrorMessage => (super.noSuchMethod(
        Invocation.getter(#favoriteErrorMessage),
        returnValue: '',
      ) as String);

  @override
  set favoriteErrorMessage(String? value) => super.noSuchMethod(
        Invocation.setter(
          #favoriteErrorMessage,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<_i8.BookItem> get listOfFavoriteBook => (super.noSuchMethod(
        Invocation.getter(#listOfFavoriteBook),
        returnValue: <_i8.BookItem>[],
      ) as List<_i8.BookItem>);

  @override
  set listOfFavoriteBook(List<_i8.BookItem>? value) => super.noSuchMethod(
        Invocation.setter(
          #listOfFavoriteBook,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<String> get listOfFavoriteBookId => (super.noSuchMethod(
        Invocation.getter(#listOfFavoriteBookId),
        returnValue: <String>[],
      ) as List<String>);

  @override
  set listOfFavoriteBookId(List<String>? value) => super.noSuchMethod(
        Invocation.setter(
          #listOfFavoriteBookId,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get loadMoreBook => (super.noSuchMethod(
        Invocation.getter(#loadMoreBook),
        returnValue: false,
      ) as bool);

  @override
  set loadMoreBook(bool? value) => super.noSuchMethod(
        Invocation.setter(
          #loadMoreBook,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i2.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_0(
          this,
          Invocation.getter(#context),
        ),
      ) as _i2.ReactiveContext);

  @override
  _i9.Future<dynamic> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);

  @override
  _i9.Future<dynamic> fetchFavoriteBooks() => (super.noSuchMethod(
        Invocation.method(
          #fetchFavoriteBooks,
          [],
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);

  @override
  _i9.Future<dynamic> fetchFavoriteBooksFromLocal() => (super.noSuchMethod(
        Invocation.method(
          #fetchFavoriteBooksFromLocal,
          [],
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);

  @override
  _i9.Future<dynamic> addBookToFavorite(String? bookId) => (super.noSuchMethod(
        Invocation.method(
          #addBookToFavorite,
          [bookId],
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);

  @override
  _i9.Future<dynamic> removeBookToFavorite(String? bookId) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeBookToFavorite,
          [bookId],
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);

  @override
  void navigateToBookDetail(_i8.BookItem? _bookItem) => super.noSuchMethod(
        Invocation.method(
          #navigateToBookDetail,
          [_bookItem],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i9.Future<dynamic> navigateToWebPage(String? url) => (super.noSuchMethod(
        Invocation.method(
          #navigateToWebPage,
          [url],
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);
}

/// A class which mocks [BooksStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockBooksStore extends _i1.Mock implements _i10.BooksStore {
  MockBooksStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i10.BooksState get booksState => (super.noSuchMethod(
        Invocation.getter(#booksState),
        returnValue: _i10.BooksState.loading,
      ) as _i10.BooksState);

  @override
  set booksState(_i10.BooksState? value) => super.noSuchMethod(
        Invocation.setter(
          #booksState,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get booksErrorMessage => (super.noSuchMethod(
        Invocation.getter(#booksErrorMessage),
        returnValue: '',
      ) as String);

  @override
  set booksErrorMessage(String? value) => super.noSuchMethod(
        Invocation.setter(
          #booksErrorMessage,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<_i8.BookItem> get listOfBook => (super.noSuchMethod(
        Invocation.getter(#listOfBook),
        returnValue: <_i8.BookItem>[],
      ) as List<_i8.BookItem>);

  @override
  set listOfBook(List<_i8.BookItem>? value) => super.noSuchMethod(
        Invocation.setter(
          #listOfBook,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get nextBooksPage => (super.noSuchMethod(
        Invocation.getter(#nextBooksPage),
        returnValue: '',
      ) as String);

  @override
  set nextBooksPage(String? value) => super.noSuchMethod(
        Invocation.setter(
          #nextBooksPage,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get loadMoreBook => (super.noSuchMethod(
        Invocation.getter(#loadMoreBook),
        returnValue: false,
      ) as bool);

  @override
  set loadMoreBook(bool? value) => super.noSuchMethod(
        Invocation.setter(
          #loadMoreBook,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get focusOnnSearchBook => (super.noSuchMethod(
        Invocation.getter(#focusOnnSearchBook),
        returnValue: false,
      ) as bool);

  @override
  set focusOnnSearchBook(bool? value) => super.noSuchMethod(
        Invocation.setter(
          #focusOnnSearchBook,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i2.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_0(
          this,
          Invocation.getter(#context),
        ),
      ) as _i2.ReactiveContext);

  @override
  _i9.Future<dynamic> fetchNextBooks({required String? nextPath}) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchNextBooks,
          [],
          {#nextPath: nextPath},
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);

  @override
  _i9.Future<dynamic> filterBooks({
    String? keywords,
    String? topic,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #filterBooks,
          [],
          {
            #keywords: keywords,
            #topic: topic,
          },
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);

  @override
  _i9.Future<dynamic> checkMoreBooks() => (super.noSuchMethod(
        Invocation.method(
          #checkMoreBooks,
          [],
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);

  @override
  void navigateToBookDetail(_i8.BookItem? _bookItem) => super.noSuchMethod(
        Invocation.method(
          #navigateToBookDetail,
          [_bookItem],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [HomeStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeStore extends _i1.Mock implements _i12.HomeStore {
  MockHomeStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i12.HomeState get booksState => (super.noSuchMethod(
        Invocation.getter(#booksState),
        returnValue: _i12.HomeState.loading,
      ) as _i12.HomeState);

  @override
  set booksState(_i12.HomeState? value) => super.noSuchMethod(
        Invocation.setter(
          #booksState,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  int get selectedIndex => (super.noSuchMethod(
        Invocation.getter(#selectedIndex),
        returnValue: 0,
      ) as int);

  @override
  set selectedIndex(int? value) => super.noSuchMethod(
        Invocation.setter(
          #selectedIndex,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i2.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_0(
          this,
          Invocation.getter(#context),
        ),
      ) as _i2.ReactiveContext);

  @override
  void onBottomBarItemTapped(int? index) => super.noSuchMethod(
        Invocation.method(
          #onBottomBarItemTapped,
          [index],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [LocalizationStore].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalizationStore extends _i1.Mock implements _i13.LocalizationStore {
  MockLocalizationStore() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Locale get locale => (super.noSuchMethod(
        Invocation.getter(#locale),
        returnValue: _FakeLocale_1(
          this,
          Invocation.getter(#locale),
        ),
      ) as _i3.Locale);

  @override
  set locale(_i3.Locale? value) => super.noSuchMethod(
        Invocation.setter(
          #locale,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.AppLocalizations get appLocalizations => (super.noSuchMethod(
        Invocation.getter(#appLocalizations),
        returnValue: _FakeAppLocalizations_2(
          this,
          Invocation.getter(#appLocalizations),
        ),
      ) as _i4.AppLocalizations);

  @override
  _i2.ReactiveContext get context => (super.noSuchMethod(
        Invocation.getter(#context),
        returnValue: _FakeReactiveContext_0(
          this,
          Invocation.getter(#context),
        ),
      ) as _i2.ReactiveContext);

  @override
  _i9.Future<bool> changeLocale(_i3.Locale? locale) => (super.noSuchMethod(
        Invocation.method(
          #changeLocale,
          [locale],
        ),
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);

  @override
  _i9.Future<void> loadLocale() => (super.noSuchMethod(
        Invocation.method(
          #loadLocale,
          [],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
}

/// A class which mocks [PackageInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockPackageInfo extends _i1.Mock implements _i14.PackageInfo {
  MockPackageInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get appName => (super.noSuchMethod(
        Invocation.getter(#appName),
        returnValue: '',
      ) as String);

  @override
  String get packageName => (super.noSuchMethod(
        Invocation.getter(#packageName),
        returnValue: '',
      ) as String);

  @override
  String get version => (super.noSuchMethod(
        Invocation.getter(#version),
        returnValue: '',
      ) as String);

  @override
  String get buildNumber => (super.noSuchMethod(
        Invocation.getter(#buildNumber),
        returnValue: '',
      ) as String);
}

/// A class which mocks [DashboardRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockDashboardRepo extends _i1.Mock implements _i15.DashboardRepo {
  MockDashboardRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i16.Response<_i17.BooksResponse>> getBooks({String? page}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getBooks,
          [],
          {#page: page},
        ),
        returnValue: _i9.Future<_i16.Response<_i17.BooksResponse>>.value(
            _i18.dummyValue<_i16.Response<_i17.BooksResponse>>(
          this,
          Invocation.method(
            #getBooks,
            [],
            {#page: page},
          ),
        )),
      ) as _i9.Future<_i16.Response<_i17.BooksResponse>>);

  @override
  _i9.Future<_i16.Response<_i17.BooksResponse>> getBestBooks() =>
      (super.noSuchMethod(
        Invocation.method(
          #getBestBooks,
          [],
        ),
        returnValue: _i9.Future<_i16.Response<_i17.BooksResponse>>.value(
            _i18.dummyValue<_i16.Response<_i17.BooksResponse>>(
          this,
          Invocation.method(
            #getBestBooks,
            [],
          ),
        )),
      ) as _i9.Future<_i16.Response<_i17.BooksResponse>>);

  @override
  _i9.Future<dynamic> setFavoriteBooksToLocal({
    required List<_i8.BookItem>? listOfBooks,
    required String? key,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #setFavoriteBooksToLocal,
          [],
          {
            #listOfBooks: listOfBooks,
            #key: key,
          },
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);

  @override
  _i9.Future<List<_i8.BookItem?>> getFavoriteBooksFromLocal(
          {required String? key}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFavoriteBooksFromLocal,
          [],
          {#key: key},
        ),
        returnValue: _i9.Future<List<_i8.BookItem?>>.value(<_i8.BookItem?>[]),
      ) as _i9.Future<List<_i8.BookItem?>>);
}

/// A class which mocks [FavoriteRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockFavoriteRepo extends _i1.Mock implements _i19.FavoriteRepo {
  MockFavoriteRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i16.Response<_i17.BooksResponse>> getFavoriteBooks(
          {required String? favoriteBookIds}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFavoriteBooks,
          [],
          {#favoriteBookIds: favoriteBookIds},
        ),
        returnValue: _i9.Future<_i16.Response<_i17.BooksResponse>>.value(
            _i18.dummyValue<_i16.Response<_i17.BooksResponse>>(
          this,
          Invocation.method(
            #getFavoriteBooks,
            [],
            {#favoriteBookIds: favoriteBookIds},
          ),
        )),
      ) as _i9.Future<_i16.Response<_i17.BooksResponse>>);

  @override
  _i9.Future<List<String>> getListOfFavoriteBookIdsFromLocal() =>
      (super.noSuchMethod(
        Invocation.method(
          #getListOfFavoriteBookIdsFromLocal,
          [],
        ),
        returnValue: _i9.Future<List<String>>.value(<String>[]),
      ) as _i9.Future<List<String>>);

  @override
  _i9.Future<void> saveFavoriteBookIdsToLocal(List<String>? bookIds) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveFavoriteBookIdsToLocal,
          [bookIds],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);

  @override
  _i9.Future<dynamic> setFavoriteBooksToLocal(
          {required List<_i8.BookItem>? listOfBooks}) =>
      (super.noSuchMethod(
        Invocation.method(
          #setFavoriteBooksToLocal,
          [],
          {#listOfBooks: listOfBooks},
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);

  @override
  _i9.Future<List<_i8.BookItem?>> getFavoriteBooksFromLocal() =>
      (super.noSuchMethod(
        Invocation.method(
          #getFavoriteBooksFromLocal,
          [],
        ),
        returnValue: _i9.Future<List<_i8.BookItem?>>.value(<_i8.BookItem?>[]),
      ) as _i9.Future<List<_i8.BookItem?>>);
}

/// A class which mocks [BooksRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockBooksRepo extends _i1.Mock implements _i20.BooksRepo {
  MockBooksRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i16.Response<_i17.BooksResponse>> getNextPageBooks(
          {String? path}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getNextPageBooks,
          [],
          {#path: path},
        ),
        returnValue: _i9.Future<_i16.Response<_i17.BooksResponse>>.value(
            _i18.dummyValue<_i16.Response<_i17.BooksResponse>>(
          this,
          Invocation.method(
            #getNextPageBooks,
            [],
            {#path: path},
          ),
        )),
      ) as _i9.Future<_i16.Response<_i17.BooksResponse>>);

  @override
  _i9.Future<_i16.Response<_i17.BooksResponse>> filterBooks({
    String? searchKeyword,
    String? topic,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #filterBooks,
          [],
          {
            #searchKeyword: searchKeyword,
            #topic: topic,
          },
        ),
        returnValue: _i9.Future<_i16.Response<_i17.BooksResponse>>.value(
            _i18.dummyValue<_i16.Response<_i17.BooksResponse>>(
          this,
          Invocation.method(
            #filterBooks,
            [],
            {
              #searchKeyword: searchKeyword,
              #topic: topic,
            },
          ),
        )),
      ) as _i9.Future<_i16.Response<_i17.BooksResponse>>);

  @override
  _i9.Future<List<String>> getListOfFavoriteBookFromLocal() =>
      (super.noSuchMethod(
        Invocation.method(
          #getListOfFavoriteBookFromLocal,
          [],
        ),
        returnValue: _i9.Future<List<String>>.value(<String>[]),
      ) as _i9.Future<List<String>>);

  @override
  _i9.Future<void> saveFavoriteBookToLocal(List<String>? bookIds) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveFavoriteBookToLocal,
          [bookIds],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);
}

/// A class which mocks [SharedPreferencesRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreferencesRepo extends _i1.Mock
    implements _i21.SharedPreferencesRepo {
  MockSharedPreferencesRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i3.Locale?> loadPreferredLocale() => (super.noSuchMethod(
        Invocation.method(
          #loadPreferredLocale,
          [],
        ),
        returnValue: _i9.Future<_i3.Locale?>.value(),
      ) as _i9.Future<_i3.Locale?>);

  @override
  _i9.Future<bool> persistPreferredLocale(_i3.Locale? locale) =>
      (super.noSuchMethod(
        Invocation.method(
          #persistPreferredLocale,
          [locale],
        ),
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);

  @override
  _i9.Future<void> saveFavoriteBooksIds(List<String>? favoriteBookIds) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveFavoriteBooksIds,
          [favoriteBookIds],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);

  @override
  _i9.Future<List<String>> getFavoriteBooksIds() => (super.noSuchMethod(
        Invocation.method(
          #getFavoriteBooksIds,
          [],
        ),
        returnValue: _i9.Future<List<String>>.value(<String>[]),
      ) as _i9.Future<List<String>>);

  @override
  _i9.Future<void> saveFavoriteBooks(
    List<String>? favoriteBook,
    String? key,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveFavoriteBooks,
          [
            favoriteBook,
            key,
          ],
        ),
        returnValue: _i9.Future<void>.value(),
        returnValueForMissingStub: _i9.Future<void>.value(),
      ) as _i9.Future<void>);

  @override
  _i9.Future<List<String>> getFavoriteBooks(String? key) => (super.noSuchMethod(
        Invocation.method(
          #getFavoriteBooks,
          [key],
        ),
        returnValue: _i9.Future<List<String>>.value(<String>[]),
      ) as _i9.Future<List<String>>);
}

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i22.NavigationService {
  MockNavigationService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.GlobalKey<_i5.NavigatorState> get navigatorKey => (super.noSuchMethod(
        Invocation.getter(#navigatorKey),
        returnValue: _FakeGlobalKey_3<_i5.NavigatorState>(
          this,
          Invocation.getter(#navigatorKey),
        ),
      ) as _i5.GlobalKey<_i5.NavigatorState>);

  @override
  void pop<T>([T? value]) => super.noSuchMethod(
        Invocation.method(
          #pop,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i9.Future<T?> push<T>(
    String? routeName, {
    Object? arguments,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #push,
          [routeName],
          {#arguments: arguments},
        ),
        returnValue: _i9.Future<T?>.value(),
      ) as _i9.Future<T?>);

  @override
  _i9.Future<dynamic> pushReplacement(
    String? routeName, {
    Object? arguments,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushReplacement,
          [routeName],
          {#arguments: arguments},
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);

  @override
  void popUntil(String? routeName) => super.noSuchMethod(
        Invocation.method(
          #popUntil,
          [routeName],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i9.Future<dynamic> clearStackAndPush(String? routeName) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndPush,
          [routeName],
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);

  @override
  _i5.Route<dynamic> generateRoute(_i5.RouteSettings? settings) =>
      (super.noSuchMethod(
        Invocation.method(
          #generateRoute,
          [settings],
        ),
        returnValue: _FakeRoute_4<dynamic>(
          this,
          Invocation.method(
            #generateRoute,
            [settings],
          ),
        ),
      ) as _i5.Route<dynamic>);
}

/// A class which mocks [ConnectionService].
///
/// See the documentation for Mockito's code generation for more information.
class MockConnectionService extends _i1.Mock implements _i23.ConnectionService {
  MockConnectionService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<bool> hasInternet() => (super.noSuchMethod(
        Invocation.method(
          #hasInternet,
          [],
        ),
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);
}

/// A class which mocks [Network].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetwork extends _i1.Mock implements _i24.Network {
  MockNetwork() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i16.ChopperClient get chopper => (super.noSuchMethod(
        Invocation.getter(#chopper),
        returnValue: _i18.dummyValue<_i16.ChopperClient>(
          this,
          Invocation.getter(#chopper),
        ),
      ) as _i16.ChopperClient);

  @override
  set chopper(_i16.ChopperClient? _chopper) => super.noSuchMethod(
        Invocation.setter(
          #chopper,
          _chopper,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set headers(Map<String, String>? _headers) => super.noSuchMethod(
        Invocation.setter(
          #headers,
          _headers,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.Api get api => (super.noSuchMethod(
        Invocation.getter(#api),
        returnValue: _FakeApi_5(
          this,
          Invocation.getter(#api),
        ),
      ) as _i6.Api);

  @override
  _i9.Future<dynamic> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);
}

/// A class which mocks [Api].
///
/// See the documentation for Mockito's code generation for more information.
class MockApi extends _i1.Mock implements _i6.Api {
  MockApi() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i16.ChopperClient get client => (super.noSuchMethod(
        Invocation.getter(#client),
        returnValue: _i18.dummyValue<_i16.ChopperClient>(
          this,
          Invocation.getter(#client),
        ),
      ) as _i16.ChopperClient);

  @override
  set client(_i16.ChopperClient? _client) => super.noSuchMethod(
        Invocation.setter(
          #client,
          _client,
        ),
        returnValueForMissingStub: null,
      );

  @override
  Type get definitionType => (super.noSuchMethod(
        Invocation.getter(#definitionType),
        returnValue: _FakeType_6(
          this,
          Invocation.getter(#definitionType),
        ),
      ) as Type);

  @override
  _i9.Future<_i16.Response<_i17.BooksResponse>> getBooks({String? page}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getBooks,
          [],
          {#page: page},
        ),
        returnValue: _i9.Future<_i16.Response<_i17.BooksResponse>>.value(
            _i18.dummyValue<_i16.Response<_i17.BooksResponse>>(
          this,
          Invocation.method(
            #getBooks,
            [],
            {#page: page},
          ),
        )),
      ) as _i9.Future<_i16.Response<_i17.BooksResponse>>);

  @override
  _i9.Future<_i16.Response<_i17.BooksResponse>> getFavoriteBooks(
          {String? ids}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFavoriteBooks,
          [],
          {#ids: ids},
        ),
        returnValue: _i9.Future<_i16.Response<_i17.BooksResponse>>.value(
            _i18.dummyValue<_i16.Response<_i17.BooksResponse>>(
          this,
          Invocation.method(
            #getFavoriteBooks,
            [],
            {#ids: ids},
          ),
        )),
      ) as _i9.Future<_i16.Response<_i17.BooksResponse>>);

  @override
  _i9.Future<_i16.Response<_i17.BooksResponse>> getBestBooks() =>
      (super.noSuchMethod(
        Invocation.method(
          #getBestBooks,
          [],
        ),
        returnValue: _i9.Future<_i16.Response<_i17.BooksResponse>>.value(
            _i18.dummyValue<_i16.Response<_i17.BooksResponse>>(
          this,
          Invocation.method(
            #getBestBooks,
            [],
          ),
        )),
      ) as _i9.Future<_i16.Response<_i17.BooksResponse>>);

  @override
  _i9.Future<_i16.Response<_i17.BooksResponse>> filterBooks({
    String? searchKeyword,
    String? topic,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #filterBooks,
          [],
          {
            #searchKeyword: searchKeyword,
            #topic: topic,
          },
        ),
        returnValue: _i9.Future<_i16.Response<_i17.BooksResponse>>.value(
            _i18.dummyValue<_i16.Response<_i17.BooksResponse>>(
          this,
          Invocation.method(
            #filterBooks,
            [],
            {
              #searchKeyword: searchKeyword,
              #topic: topic,
            },
          ),
        )),
      ) as _i9.Future<_i16.Response<_i17.BooksResponse>>);

  @override
  _i9.Future<_i16.Response<_i17.BooksResponse>> getNextPageBooks(
          {String? path}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getNextPageBooks,
          [],
          {#path: path},
        ),
        returnValue: _i9.Future<_i16.Response<_i17.BooksResponse>>.value(
            _i18.dummyValue<_i16.Response<_i17.BooksResponse>>(
          this,
          Invocation.method(
            #getNextPageBooks,
            [],
            {#path: path},
          ),
        )),
      ) as _i9.Future<_i16.Response<_i17.BooksResponse>>);
}
