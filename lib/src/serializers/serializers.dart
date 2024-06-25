library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:palm_code/src/books/podo/book_format.dart';
import 'package:palm_code/src/books/podo/book_item.dart';
import 'package:palm_code/src/books/podo/books_response.dart';
import 'package:palm_code/src/books/podo/people.dart';
import 'package:palm_code/src/serializers/serializers_extension.dart';

part 'serializers.g.dart';

@SerializersFor([
  BooksResponse,
  BooksItem,
  BookFormat,
  People,
])
final Serializers _serializers = _$_serializers;

final Serializers standardSerializers = _serializers.withJsonPlugin();
