// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.source_class;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ValueSourceClass extends ValueSourceClass {
  @override
  final ClassElement element;
  ParsedLibraryResult __parsedLibrary;
  String __name;
  String __implName;
  ClassElement __builderElement;
  bool __implementsBuilt;
  bool __extendsIsAllowed;
  BuiltValue __settings;
  BuiltList<String> __genericParameters;
  BuiltList<String> __genericBounds;
  ClassDeclaration __classDeclaration;
  bool __hasBuilder;
  String __builderParameters;
  BuiltList<ValueSourceField> __fields;
  String __source;
  String __partStatement;
  bool __hasPartStatement;
  bool __hasBuiltValueImportWithShow;
  bool __hasBuiltValueImportWithAs;
  bool __valueClassIsAbstract;
  BuiltList<ConstructorDeclaration> __valueClassConstructors;
  BuiltList<ConstructorDeclaration> __valueClassFactories;
  bool __builderClassIsAbstract;
  BuiltList<String> __builderClassConstructors;
  BuiltList<String> __builderClassFactories;
  BuiltList<MemoizedGetter> __memoizedGetters;
  BuiltList<String> __builderImplements;
  bool __implementsHashCode;
  bool __implementsOperatorEquals;
  bool __implementsToString;
  CompilationUnitElement __compilationUnit;

  factory _$ValueSourceClass([void updates(ValueSourceClassBuilder b)]) =>
      (new ValueSourceClassBuilder()..update(updates)).build();

  _$ValueSourceClass._({this.element}) : super._() {
    if (element == null) {
      throw new BuiltValueNullFieldError('ValueSourceClass', 'element');
    }
  }

  @override
  ParsedLibraryResult get parsedLibrary =>
      __parsedLibrary ??= super.parsedLibrary;

  @override
  String get name => __name ??= super.name;

  @override
  String get implName => __implName ??= super.implName;

  @override
  ClassElement get builderElement => __builderElement ??= super.builderElement;

  @override
  bool get implementsBuilt => __implementsBuilt ??= super.implementsBuilt;

  @override
  bool get extendsIsAllowed => __extendsIsAllowed ??= super.extendsIsAllowed;

  @override
  BuiltValue get settings => __settings ??= super.settings;

  @override
  BuiltList<String> get genericParameters =>
      __genericParameters ??= super.genericParameters;

  @override
  BuiltList<String> get genericBounds =>
      __genericBounds ??= super.genericBounds;

  @override
  ClassDeclaration get classDeclaration =>
      __classDeclaration ??= super.classDeclaration;

  @override
  bool get hasBuilder => __hasBuilder ??= super.hasBuilder;

  @override
  String get builderParameters =>
      __builderParameters ??= super.builderParameters;

  @override
  BuiltList<ValueSourceField> get fields => __fields ??= super.fields;

  @override
  String get source => __source ??= super.source;

  @override
  String get partStatement => __partStatement ??= super.partStatement;

  @override
  bool get hasPartStatement => __hasPartStatement ??= super.hasPartStatement;

  @override
  bool get hasBuiltValueImportWithShow =>
      __hasBuiltValueImportWithShow ??= super.hasBuiltValueImportWithShow;

  @override
  bool get hasBuiltValueImportWithAs =>
      __hasBuiltValueImportWithAs ??= super.hasBuiltValueImportWithAs;

  @override
  bool get valueClassIsAbstract =>
      __valueClassIsAbstract ??= super.valueClassIsAbstract;

  @override
  BuiltList<ConstructorDeclaration> get valueClassConstructors =>
      __valueClassConstructors ??= super.valueClassConstructors;

  @override
  BuiltList<ConstructorDeclaration> get valueClassFactories =>
      __valueClassFactories ??= super.valueClassFactories;

  @override
  bool get builderClassIsAbstract =>
      __builderClassIsAbstract ??= super.builderClassIsAbstract;

  @override
  BuiltList<String> get builderClassConstructors =>
      __builderClassConstructors ??= super.builderClassConstructors;

  @override
  BuiltList<String> get builderClassFactories =>
      __builderClassFactories ??= super.builderClassFactories;

  @override
  BuiltList<MemoizedGetter> get memoizedGetters =>
      __memoizedGetters ??= super.memoizedGetters;

  @override
  BuiltList<String> get builderImplements =>
      __builderImplements ??= super.builderImplements;

  @override
  bool get implementsHashCode =>
      __implementsHashCode ??= super.implementsHashCode;

  @override
  bool get implementsOperatorEquals =>
      __implementsOperatorEquals ??= super.implementsOperatorEquals;

  @override
  bool get implementsToString =>
      __implementsToString ??= super.implementsToString;

  @override
  CompilationUnitElement get compilationUnit =>
      __compilationUnit ??= super.compilationUnit;

  @override
  ValueSourceClass rebuild(void updates(ValueSourceClassBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ValueSourceClassBuilder toBuilder() =>
      new ValueSourceClassBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValueSourceClass && element == other.element;
  }

  @override
  int get hashCode {
    return $jf($jc(0, element.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ValueSourceClass')
          ..add('element', element))
        .toString();
  }
}

class ValueSourceClassBuilder
    implements Builder<ValueSourceClass, ValueSourceClassBuilder> {
  _$ValueSourceClass _$v;

  ClassElement _element;
  ClassElement get element => _$this._element;
  set element(ClassElement element) => _$this._element = element;

  ValueSourceClassBuilder();

  ValueSourceClassBuilder get _$this {
    if (_$v != null) {
      _element = _$v.element;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueSourceClass other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ValueSourceClass;
  }

  @override
  void update(void updates(ValueSourceClassBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ValueSourceClass build() {
    final _$result = _$v ?? new _$ValueSourceClass._(element: element);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
