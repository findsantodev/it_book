import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:palm_code/src/books/podo/book_format.dart';
import 'package:palm_code/src/books/podo/people.dart';
import 'package:palm_code/src/serializers/serializers.dart';

part 'book_item.g.dart';

abstract class BooksItem implements Built<BooksItem, BooksItemBuilder> {
  factory BooksItem([void Function(BooksItemBuilder)? updates]) = _$BooksItem;
  @BuiltValueField(wireName: "id")
  int get id;

  @BuiltValueField(wireName: "title")
  String? get title;

  @BuiltValueField(wireName: "authors")
  BuiltList<People>? get authors;

  @BuiltValueField(wireName: "translators")
  BuiltList<People>? get translators;

  @BuiltValueField(wireName: "subjects")
  BuiltList<String>? get subjects;

  @BuiltValueField(wireName: "bookshelves")
  BuiltList<String>? get bookshelves;

  @BuiltValueField(wireName: "languages")
  BuiltList<String>? get languages;

  @BuiltValueField(wireName: "copyright")
  bool? get copyright;

  @BuiltValueField(wireName: "media_type")
  String? get mediaType;

  @BuiltValueField(wireName: "formats")
  BookFormat? get formats;

  @BuiltValueField(wireName: "download_count")
  int? get downloadCount;

  BooksItem._();

  static Serializer<BooksItem> get serializer => _$booksItemSerializer;

  static BooksItem? fromJson(Map<String, dynamic> jsonMap) {
    return standardSerializers.deserializeWith(
      BooksItem.serializer,
      jsonMap,
    );
  }
}
