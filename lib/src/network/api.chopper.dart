// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$Api extends Api {
  _$Api([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = Api;

  @override
  Future<Response<BooksResponse>> getBooks({String? page}) {
    final Uri $url = Uri.parse('/books/?page=${page}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BooksResponse, BooksResponse>($request);
  }

  @override
  Future<Response<BooksResponse>> getFavoriteBooks({String? ids}) {
    final Uri $url = Uri.parse('/books/?ids=${ids}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BooksResponse, BooksResponse>($request);
  }

  @override
  Future<Response<BooksResponse>> getBestBooks() {
    final Uri $url = Uri.parse('/books?topic=best%20book');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BooksResponse, BooksResponse>($request);
  }

  @override
  Future<Response<BooksResponse>> filterBooks({
    String? searchKeyword,
    String? topic,
  }) {
    final Uri $url = Uri.parse('/books${searchKeyword}${topic}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BooksResponse, BooksResponse>($request);
  }

  @override
  Future<Response<BooksResponse>> getNextPageBooks({String? path}) {
    final Uri $url = Uri.parse('/books/${path}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BooksResponse, BooksResponse>($request);
  }
}
