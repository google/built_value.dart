// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializer_source_class.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SerializerSourceClass extends SerializerSourceClass {
  @override
  final ParsedLibraryResults parsedLibraryResults;
  @override
  final InterfaceElement element;
  @override
  final ClassElement? builderElement;
  ParsedLibraryResult? __parsedLibrary;
  BuiltValue? __builtValueSettings;
  bool? __hasBuilder;
  BuiltValueSerializer? __serializerSettings;
  BuiltValueEnum? __enumClassSettings;
  String? __name;
  String? __wireName;
  String? __serializerDeclaration;
  BuiltList<String>? __genericParameters;
  BuiltList<String>? __genericBounds;
  String? __genericBoundsOrObjectString;
  bool? __isBuiltValue;
  bool? __isEnumClass;
  BuiltList<SerializerSourceField>? __fields;
  BuiltSet<SerializerSourceClass>? __fieldClasses;
  CompilationUnitElement? __compilationUnit;
  String? __serializerImplName;
  String? __serializerInstanceName;
  bool? __isSerializable;
  bool? __needsGeneratedSerializer;
  String? __implName;

  factory _$SerializerSourceClass(
          [void Function(SerializerSourceClassBuilder)? updates]) =>
      (SerializerSourceClassBuilder()..update(updates))._build();

  _$SerializerSourceClass._(
      {required this.parsedLibraryResults,
      required this.element,
      this.builderElement})
      : super._();
  @override
  ParsedLibraryResult get parsedLibrary =>
      __parsedLibrary ??= super.parsedLibrary;

  @override
  BuiltValue get builtValueSettings =>
      __builtValueSettings ??= super.builtValueSettings;

  @override
  bool get hasBuilder => __hasBuilder ??= super.hasBuilder;

  @override
  BuiltValueSerializer get serializerSettings =>
      __serializerSettings ??= super.serializerSettings;

  @override
  BuiltValueEnum get enumClassSettings =>
      __enumClassSettings ??= super.enumClassSettings;

  @override
  String get name => __name ??= super.name;

  @override
  String get wireName => __wireName ??= super.wireName;

  @override
  String get serializerDeclaration =>
      __serializerDeclaration ??= super.serializerDeclaration;

  @override
  BuiltList<String> get genericParameters =>
      __genericParameters ??= super.genericParameters;

  @override
  BuiltList<String> get genericBounds =>
      __genericBounds ??= super.genericBounds;

  @override
  String get genericBoundsOrObjectString =>
      __genericBoundsOrObjectString ??= super.genericBoundsOrObjectString;

  @override
  bool get isBuiltValue => __isBuiltValue ??= super.isBuiltValue;

  @override
  bool get isEnumClass => __isEnumClass ??= super.isEnumClass;

  @override
  BuiltList<SerializerSourceField> get fields => __fields ??= super.fields;

  @override
  BuiltSet<SerializerSourceClass> get fieldClasses =>
      __fieldClasses ??= super.fieldClasses;

  @override
  CompilationUnitElement get compilationUnit =>
      __compilationUnit ??= super.compilationUnit;

  @override
  String get serializerImplName =>
      __serializerImplName ??= super.serializerImplName;

  @override
  String get serializerInstanceName =>
      __serializerInstanceName ??= super.serializerInstanceName;

  @override
  bool get isSerializable => __isSerializable ??= super.isSerializable;

  @override
  bool get needsGeneratedSerializer =>
      __needsGeneratedSerializer ??= super.needsGeneratedSerializer;

  @override
  String get implName => __implName ??= super.implName;

  @override
  SerializerSourceClass rebuild(
          void Function(SerializerSourceClassBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SerializerSourceClassBuilder toBuilder() =>
      SerializerSourceClassBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SerializerSourceClass &&
        parsedLibraryResults == other.parsedLibraryResults &&
        element == other.element &&
        builderElement == other.builderElement;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, parsedLibraryResults.hashCode);
    _$hash = $jc(_$hash, element.hashCode);
    _$hash = $jc(_$hash, builderElement.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SerializerSourceClass')
          ..add('parsedLibraryResults', parsedLibraryResults)
          ..add('element', element)
          ..add('builderElement', builderElement))
        .toString();
  }
}

class SerializerSourceClassBuilder
    implements Builder<SerializerSourceClass, SerializerSourceClassBuilder> {
  _$SerializerSourceClass? _$v;

  ParsedLibraryResults? _parsedLibraryResults;
  ParsedLibraryResults? get parsedLibraryResults =>
      _$this._parsedLibraryResults;
  set parsedLibraryResults(ParsedLibraryResults? parsedLibraryResults) =>
      _$this._parsedLibraryResults = parsedLibraryResults;

  InterfaceElement? _element;
  InterfaceElement? get element => _$this._element;
  set element(InterfaceElement? element) => _$this._element = element;

  ClassElement? _builderElement;
  ClassElement? get builderElement => _$this._builderElement;
  set builderElement(ClassElement? builderElement) =>
      _$this._builderElement = builderElement;

  SerializerSourceClassBuilder();

  SerializerSourceClassBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _parsedLibraryResults = $v.parsedLibraryResults;
      _element = $v.element;
      _builderElement = $v.builderElement;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SerializerSourceClass other) {
    _$v = other as _$SerializerSourceClass;
  }

  @override
  void update(void Function(SerializerSourceClassBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SerializerSourceClass build() => _build();

  _$SerializerSourceClass _build() {
    final _$result = _$v ??
        _$SerializerSourceClass._(
          parsedLibraryResults: BuiltValueNullFieldError.checkNotNull(
              parsedLibraryResults,
              r'SerializerSourceClass',
              'parsedLibraryResults'),
          element: BuiltValueNullFieldError.checkNotNull(
              element, r'SerializerSourceClass', 'element'),
          builderElement: builderElement,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
