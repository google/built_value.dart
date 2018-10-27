// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.source_library;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SerializerSourceLibrary extends SerializerSourceLibrary {
  @override
  final LibraryElement element;
  bool __hasSerializers;
  BuiltMap<String, ElementAnnotation> __serializersForAnnotations;
  BuiltSet<SerializerSourceClass> __sourceClasses;
  BuiltSetMultimap<String, SerializerSourceClass> __serializeForClasses;
  BuiltSetMultimap<String, SerializerSourceClass>
      __serializeForTransitiveClasses;

  factory _$SerializerSourceLibrary(
          [void updates(SerializerSourceLibraryBuilder b)]) =>
      (new SerializerSourceLibraryBuilder()..update(updates)).build();

  _$SerializerSourceLibrary._({this.element}) : super._() {
    if (element == null) {
      throw new BuiltValueNullFieldError('SerializerSourceLibrary', 'element');
    }
  }

  @override
  bool get hasSerializers => __hasSerializers ??= super.hasSerializers;

  @override
  BuiltMap<String, ElementAnnotation> get serializersForAnnotations =>
      __serializersForAnnotations ??= super.serializersForAnnotations;

  @override
  BuiltSet<SerializerSourceClass> get sourceClasses =>
      __sourceClasses ??= super.sourceClasses;

  @override
  BuiltSetMultimap<String, SerializerSourceClass> get serializeForClasses =>
      __serializeForClasses ??= super.serializeForClasses;

  @override
  BuiltSetMultimap<String, SerializerSourceClass>
      get serializeForTransitiveClasses => __serializeForTransitiveClasses ??=
          super.serializeForTransitiveClasses;

  @override
  SerializerSourceLibrary rebuild(
          void updates(SerializerSourceLibraryBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SerializerSourceLibraryBuilder toBuilder() =>
      new SerializerSourceLibraryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SerializerSourceLibrary && element == other.element;
  }

  @override
  int get hashCode {
    return $jf($jc(0, element.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SerializerSourceLibrary')
          ..add('element', element))
        .toString();
  }
}

class SerializerSourceLibraryBuilder
    implements
        Builder<SerializerSourceLibrary, SerializerSourceLibraryBuilder> {
  _$SerializerSourceLibrary _$v;

  LibraryElement _element;
  LibraryElement get element => _$this._element;
  set element(LibraryElement element) => _$this._element = element;

  SerializerSourceLibraryBuilder();

  SerializerSourceLibraryBuilder get _$this {
    if (_$v != null) {
      _element = _$v.element;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SerializerSourceLibrary other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SerializerSourceLibrary;
  }

  @override
  void update(void updates(SerializerSourceLibraryBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SerializerSourceLibrary build() {
    final _$result = _$v ?? new _$SerializerSourceLibrary._(element: element);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_as
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals
