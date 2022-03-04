import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'mangas_record.g.dart';

abstract class MangasRecord
    implements Built<MangasRecord, MangasRecordBuilder> {
  static Serializer<MangasRecord> get serializer => _$mangasRecordSerializer;

  @nullable
  String get title;

  @nullable
  String get cover;

  @nullable
  int get nbTomes;

  @nullable
  bool get inMyList;

  @nullable
  String get resume;

  @nullable
  int get nbTomesPossedes;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MangasRecordBuilder builder) => builder
    ..title = ''
    ..cover = ''
    ..nbTomes = 0
    ..inMyList = false
    ..resume = ''
    ..nbTomesPossedes = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mangas');

  static Stream<MangasRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<MangasRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  MangasRecord._();
  factory MangasRecord([void Function(MangasRecordBuilder) updates]) =
      _$MangasRecord;

  static MangasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMangasRecordData({
  String title,
  String cover,
  int nbTomes,
  bool inMyList,
  String resume,
  int nbTomesPossedes,
}) =>
    serializers.toFirestore(
        MangasRecord.serializer,
        MangasRecord((m) => m
          ..title = title
          ..cover = cover
          ..nbTomes = nbTomes
          ..inMyList = inMyList
          ..resume = resume
          ..nbTomesPossedes = nbTomesPossedes));
