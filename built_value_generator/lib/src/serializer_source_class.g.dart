// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.source_class;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SerializerSourceClass extends SerializerSourceClass {
  @override
  final ClassElement element;
  @override
  final ClassElement builderElement;
  ParsedLibraryResult __parsedLibrary;
  BuiltValue __builtValueSettings;
  BuiltValueSerializer __serializerSettings;
  BuiltValueEnum __enumClassSettings;
  String __name;
  String __wireName;
  String __serializerDeclaration;
  BuiltList<String> __genericParameters;
  BuiltList<String> __genericBounds;
  bool __isBuiltValue;
  bool __isEnumClass;
  BuiltList<SerializerSourceField> __fields;
  BuiltSet<SerializerSourceClass> __fieldClasses;
  CompilationUnitElement __compilationUnit;
  bool __isSerializable;
  bool __needsGeneratedSerializer;

  factory _$SerializerSourceClass(
          [void updates(SerializerSourceClassBuilder b)]) =>
      (new SerializerSourceClassBuilder()..update(updates)).build();

  _$SerializerSourceClass._({this.element, this.builderElement}) : super._() {
    if (element == null) {
      throw new BuiltValueNullFieldError('SerializerSourceClass', 'element');
    }
  }

  @override
  ParsedLibraryResult get parsedLibrary =>
      __parsedLibrary ??= super.parsedLibrary;

  @override
  BuiltValue get builtValueSettings =>
      __builtValueSettings ??= super.builtValueSettings;

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
  bool get isSerializable => __isSerializable ??= super.isSerializable;

  @override
  bool get needsGeneratedSerializer =>
      __needsGeneratedSerializer ??= super.needsGeneratedSerializer;

  @override
  SerializerSourceClass rebuild(void updates(SerializerSourceClassBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SerializerSourceClassBuilder toBuilder() =>
      new SerializerSourceClassBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SerializerSourceClass &&
        element == other.element &&
        builderElement == other.builderElement;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, element.hashCode), builderElement.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SerializerSourceClass')
          ..add('element', element)
          ..add('builderElement', builderElement))
        .toString();
  }
}

class SerializerSourceClassBuilder
    implements Builder<SerializerSourceClass, SerializerSourceClassBuilder> {
  _$SerializerSourceClass _$v;

  ClassElement _element;
  ClassElement get element => _$this._element;
  set element(ClassElement element) => _$this._element = element;

  ClassElement _builderElement;
  ClassElement get builderElement => _$this._builderElement;
  set builderElement(ClassElement builderElement) =>
      _$this._builderElement = builderElement;

  SerializerSourceClassBuilder();

  SerializerSourceClassBuilder get _$this {
    if (_$v != null) {
      _element = _$v.element;
      _builderElement = _$v.builderElement;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SerializerSourceClass other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SerializerSourceClass;
  }

  @override
  void update(void updates(SerializerSourceClassBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SerializerSourceClass build() {
    final _$result = _$v ??
        new _$SerializerSourceClass._(
            element: element, builderElement: builderElement);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
