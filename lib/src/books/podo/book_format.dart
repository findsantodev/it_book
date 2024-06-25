import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:palm_code/src/serializers/serializers.dart';

part 'book_format.g.dart';

abstract class BookFormat implements Built<BookFormat, BookFormatBuilder> {
  factory BookFormat([void Function(BookFormatBuilder)? updates]) =
      _$BookFormat;
  @BuiltValueField(wireName: "text/html")
  String? get textHTML;

  @BuiltValueField(wireName: "application/epub+zip")
  String? get applicationEPubZIP;

  @BuiltValueField(wireName: "application/x-mobipocket-ebook")
  String? get applicationXMobipocketEbook;

  @BuiltValueField(wireName: "application/rdf+xml")
  String? get applicationRDFXML;

  @BuiltValueField(wireName: "image/jpeg")
  String? get cover;

  @BuiltValueField(wireName: "text/plain; charset=us-ascii")
  String? get textPlain;

  @BuiltValueField(wireName: "application/octet-stream")
  String? get applicationOctetStream;

  BookFormat._();

  static Serializer<BookFormat> get serializer => _$bookFormatSerializer;

  static BookFormat? fromJson(Map<String, dynamic> jsonMap) {
    return standardSerializers.deserializeWith(
      BookFormat.serializer,
      jsonMap,
    );
  }
}
