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
    var _$hash = 0;
    _$hash = $jc(_$hash, element.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
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

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
