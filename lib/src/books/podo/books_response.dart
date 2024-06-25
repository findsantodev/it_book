import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:palm_code/src/books/podo/book_item.dart';
import 'package:palm_code/src/serializers/serializers.dart';

part 'books_response.g.dart';

abstract class BooksResponse
    implements Built<BooksResponse, BooksResponseBuilder> {
  factory BooksResponse([
    void Function(BooksResponseBuilder)? updates,
  ]) = _$BooksResponse;

  @BuiltValueField()
  String? get detail;

  @BuiltValueField()
  int? get count;

  @BuiltValueField()
  String? get next;

  @BuiltValueField()
  String? get previous;

  @BuiltValueField()
  BuiltList<BooksItem>? get results;

  BooksResponse._();

  static BooksResponse? fromJson(Map<String, dynamic> json) {
    return standardSerializers.deserializeWith(
      BooksResponse.serializer,
      json,
    );
  }

  static Serializer<BooksResponse> get serializer => _$booksResponseSerializer;
}
