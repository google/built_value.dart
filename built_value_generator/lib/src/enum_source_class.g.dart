// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.enum_source_class;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EnumSourceClass extends EnumSourceClass {
  @override
  final ClassElement element;
  ParsedLibraryResult __parsedLibrary;
  String __name;
  String __wireName;
  BuiltValueEnum __settings;
  bool __isAbstract;
  BuiltList<EnumSourceField> __fields;
  BuiltList<String> __constructors;
  String __valuesIdentifier;
  String __valueOfIdentifier;
  bool __usesMixin;
  String __mixinDeclaration;
  Iterable<String> __identifiers;

  factory _$EnumSourceClass([void updates(EnumSourceClassBuilder b)]) =>
      (new EnumSourceClassBuilder()..update(updates)).build();

  _$EnumSourceClass._({this.element}) : super._() {
    if (element == null) {
      throw new BuiltValueNullFieldError('EnumSourceClass', 'element');
    }
  }

  @override
  ParsedLibraryResult get parsedLibrary =>
      __parsedLibrary ??= super.parsedLibrary;

  @override
  String get name => __name ??= super.name;

  @override
  String get wireName => __wireName ??= super.wireName;

  @override
  BuiltValueEnum get settings => __settings ??= super.settings;

  @override
  bool get isAbstract => __isAbstract ??= super.isAbstract;

  @override
  BuiltList<EnumSourceField> get fields => __fields ??= super.fields;

  @override
  BuiltList<String> get constructors => __constructors ??= super.constructors;

  @override
  String get valuesIdentifier => __valuesIdentifier ??= super.valuesIdentifier;

  @override
  String get valueOfIdentifier =>
      __valueOfIdentifier ??= super.valueOfIdentifier;

  @override
  bool get usesMixin => __usesMixin ??= super.usesMixin;

  @override
  String get mixinDeclaration => __mixinDeclaration ??= super.mixinDeclaration;

  @override
  Iterable<String> get identifiers => __identifiers ??= super.identifiers;

  @override
  EnumSourceClass rebuild(void updates(EnumSourceClassBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  EnumSourceClassBuilder toBuilder() =>
      new EnumSourceClassBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EnumSourceClass && element == other.element;
  }

  @override
  int get hashCode {
    return $jf($jc(0, element.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EnumSourceClass')
          ..add('element', element))
        .toString();
  }
}

class EnumSourceClassBuilder
    implements Builder<EnumSourceClass, EnumSourceClassBuilder> {
  _$EnumSourceClass _$v;

  ClassElement _element;
  ClassElement get element => _$this._element;
  set element(ClassElement element) => _$this._element = element;

  EnumSourceClassBuilder();

  EnumSourceClassBuilder get _$this {
    if (_$v != null) {
      _element = _$v.element;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnumSourceClass other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EnumSourceClass;
  }

  @override
  void update(void updates(EnumSourceClassBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$EnumSourceClass build() {
    final _$result = _$v ?? new _$EnumSourceClass._(element: element);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
