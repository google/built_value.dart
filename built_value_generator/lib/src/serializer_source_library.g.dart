// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.source_library;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SerializerSourceLibrary extends SerializerSourceLibrary {
  @override
  final LibraryElement element;
  ParsedLibraryResult? __parsedLibrary;
  bool? __hasSerializers;
  BuiltMap<String, ElementAnnotation>? __serializersForAnnotations;
  BuiltList<String>? __wrongSerializersDeclarations;
  BuiltSet<SerializerSourceClass>? __sourceClasses;
  BuiltSetMultimap<String, SerializerSourceClass>? __serializeForClasses;
  BuiltSetMultimap<String, SerializerSourceClass>?
      __serializeForTransitiveClasses;

  factory _$SerializerSourceLibrary(
          [void Function(SerializerSourceLibraryBuilder)? updates]) =>
      (new SerializerSourceLibraryBuilder()..update(updates))._build();

  _$SerializerSourceLibrary._({required this.element}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        element, r'SerializerSourceLibrary', 'element');
  }

  @override
  ParsedLibraryResult get parsedLibrary =>
      __parsedLibrary ??= super.parsedLibrary;

  @override
  bool get hasSerializers => __hasSerializers ??= super.hasSerializers;

  @override
  BuiltMap<String, ElementAnnotation> get serializersForAnnotations =>
      __serializersForAnnotations ??= super.serializersForAnnotations;

  @override
  BuiltList<String> get wrongSerializersDeclarations =>
      __wrongSerializersDeclarations ??= super.wrongSerializersDeclarations;

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
          void Function(SerializerSourceLibraryBuilder) updates) =>
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
    return (newBuiltValueToStringHelper(r'SerializerSourceLibrary')
          ..add('element', element))
        .toString();
  }
}

class SerializerSourceLibraryBuilder
    implements
        Builder<SerializerSourceLibrary, SerializerSourceLibraryBuilder> {
  _$SerializerSourceLibrary? _$v;

  LibraryElement? _element;
  LibraryElement? get element => _$this._element;
  set element(LibraryElement? element) => _$this._element = element;

  SerializerSourceLibraryBuilder();

  SerializerSourceLibraryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _element = $v.element;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SerializerSourceLibrary other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SerializerSourceLibrary;
  }

  @override
  void update(void Function(SerializerSourceLibraryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SerializerSourceLibrary build() => _build();

  _$SerializerSourceLibrary _build() {
    final _$result = _$v ??
        new _$SerializerSourceLibrary._(
            element: BuiltValueNullFieldError.checkNotNull(
                element, r'SerializerSourceLibrary', 'element'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
