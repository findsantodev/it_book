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
  Future<Response<BooksResponse>> getBooks() {
    final Uri $url = Uri.parse('/books');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BooksResponse, BooksResponse>($request);
  }
}
