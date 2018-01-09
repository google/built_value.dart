// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.source_class;

// **************************************************************************
// Generator: BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_returning_this
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

class _$SerializerSourceClass extends SerializerSourceClass {
  @override
  final ClassElement element;
  @override
  final ClassElement builderElement;
  BuiltValue __builtValueSettings;
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

  factory _$SerializerSourceClass(
          [void updates(SerializerSourceClassBuilder b)]) =>
      (new SerializerSourceClassBuilder()..update(updates)).build();

  _$SerializerSourceClass._({this.element, this.builderElement}) : super._() {
    if (element == null)
      throw new BuiltValueNullFieldError('SerializerSourceClass', 'element');
  }

  @override
  BuiltValue get builtValueSettings =>
      __builtValueSettings ??= super.builtValueSettings;

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
  SerializerSourceClass rebuild(void updates(SerializerSourceClassBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SerializerSourceClassBuilder toBuilder() =>
      new SerializerSourceClassBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SerializerSourceClass) return false;
    return element == other.element && builderElement == other.builderElement;
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
    if (other == null) throw new ArgumentError.notNull('other');
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
