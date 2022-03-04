// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mangas_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MangasRecord> _$mangasRecordSerializer =
    new _$MangasRecordSerializer();

class _$MangasRecordSerializer implements StructuredSerializer<MangasRecord> {
  @override
  final Iterable<Type> types = const [MangasRecord, _$MangasRecord];
  @override
  final String wireName = 'MangasRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, MangasRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cover;
    if (value != null) {
      result
        ..add('cover')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nbTomes;
    if (value != null) {
      result
        ..add('nbTomes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.inMyList;
    if (value != null) {
      result
        ..add('inMyList')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.resume;
    if (value != null) {
      result
        ..add('resume')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nbTomesPossedes;
    if (value != null) {
      result
        ..add('nbTomesPossedes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  MangasRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MangasRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'cover':
          result.cover = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'nbTomes':
          result.nbTomes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'inMyList':
          result.inMyList = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'resume':
          result.resume = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'nbTomesPossedes':
          result.nbTomesPossedes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$MangasRecord extends MangasRecord {
  @override
  final String title;
  @override
  final String cover;
  @override
  final int nbTomes;
  @override
  final bool inMyList;
  @override
  final String resume;
  @override
  final int nbTomesPossedes;
  @override
  final DocumentReference<Object> reference;

  factory _$MangasRecord([void Function(MangasRecordBuilder) updates]) =>
      (new MangasRecordBuilder()..update(updates)).build();

  _$MangasRecord._(
      {this.title,
      this.cover,
      this.nbTomes,
      this.inMyList,
      this.resume,
      this.nbTomesPossedes,
      this.reference})
      : super._();

  @override
  MangasRecord rebuild(void Function(MangasRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MangasRecordBuilder toBuilder() => new MangasRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MangasRecord &&
        title == other.title &&
        cover == other.cover &&
        nbTomes == other.nbTomes &&
        inMyList == other.inMyList &&
        resume == other.resume &&
        nbTomesPossedes == other.nbTomesPossedes &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, title.hashCode), cover.hashCode),
                        nbTomes.hashCode),
                    inMyList.hashCode),
                resume.hashCode),
            nbTomesPossedes.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MangasRecord')
          ..add('title', title)
          ..add('cover', cover)
          ..add('nbTomes', nbTomes)
          ..add('inMyList', inMyList)
          ..add('resume', resume)
          ..add('nbTomesPossedes', nbTomesPossedes)
          ..add('reference', reference))
        .toString();
  }
}

class MangasRecordBuilder
    implements Builder<MangasRecord, MangasRecordBuilder> {
  _$MangasRecord _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _cover;
  String get cover => _$this._cover;
  set cover(String cover) => _$this._cover = cover;

  int _nbTomes;
  int get nbTomes => _$this._nbTomes;
  set nbTomes(int nbTomes) => _$this._nbTomes = nbTomes;

  bool _inMyList;
  bool get inMyList => _$this._inMyList;
  set inMyList(bool inMyList) => _$this._inMyList = inMyList;

  String _resume;
  String get resume => _$this._resume;
  set resume(String resume) => _$this._resume = resume;

  int _nbTomesPossedes;
  int get nbTomesPossedes => _$this._nbTomesPossedes;
  set nbTomesPossedes(int nbTomesPossedes) =>
      _$this._nbTomesPossedes = nbTomesPossedes;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  MangasRecordBuilder() {
    MangasRecord._initializeBuilder(this);
  }

  MangasRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _cover = $v.cover;
      _nbTomes = $v.nbTomes;
      _inMyList = $v.inMyList;
      _resume = $v.resume;
      _nbTomesPossedes = $v.nbTomesPossedes;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MangasRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MangasRecord;
  }

  @override
  void update(void Function(MangasRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MangasRecord build() {
    final _$result = _$v ??
        new _$MangasRecord._(
            title: title,
            cover: cover,
            nbTomes: nbTomes,
            inMyList: inMyList,
            resume: resume,
            nbTomesPossedes: nbTomesPossedes,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
