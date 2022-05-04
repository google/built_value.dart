// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.enum_source_field;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EnumSourceField extends EnumSourceField {
  @override
  final ParsedLibraryResult parsedLibrary;
  @override
  final FieldElement element;
  String? __name;
  String? __type;
  bool ___type = false;
  BuiltValueEnumConst? __settings;
  String? __generatedIdentifier;
  bool? __isConst;
  bool? __isStatic;

  factory _$EnumSourceField([void Function(EnumSourceFieldBuilder)? updates]) =>
      (new EnumSourceFieldBuilder()..update(updates))._build();

  _$EnumSourceField._({required this.parsedLibrary, required this.element})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        parsedLibrary, 'EnumSourceField', 'parsedLibrary');
    BuiltValueNullFieldError.checkNotNull(
        element, 'EnumSourceField', 'element');
  }

  @override
  String get name => __name ??= super.name;

  @override
  String? get type {
    if (!___type) {
      __type = super.type;
      ___type = true;
    }
    return __type;
  }

  @override
  BuiltValueEnumConst get settings => __settings ??= super.settings;

  @override
  String get generatedIdentifier =>
      __generatedIdentifier ??= super.generatedIdentifier;

  @override
  bool get isConst => __isConst ??= super.isConst;

  @override
  bool get isStatic => __isStatic ??= super.isStatic;

  @override
  EnumSourceField rebuild(void Function(EnumSourceFieldBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EnumSourceFieldBuilder toBuilder() =>
      new EnumSourceFieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EnumSourceField &&
        parsedLibrary == other.parsedLibrary &&
        element == other.element;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, parsedLibrary.hashCode), element.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EnumSourceField')
          ..add('parsedLibrary', parsedLibrary)
          ..add('element', element))
        .toString();
  }
}

class EnumSourceFieldBuilder
    implements Builder<EnumSourceField, EnumSourceFieldBuilder> {
  _$EnumSourceField? _$v;

  ParsedLibraryResult? _parsedLibrary;
  ParsedLibraryResult? get parsedLibrary => _$this._parsedLibrary;
  set parsedLibrary(ParsedLibraryResult? parsedLibrary) =>
      _$this._parsedLibrary = parsedLibrary;

  FieldElement? _element;
  FieldElement? get element => _$this._element;
  set element(FieldElement? element) => _$this._element = element;

  EnumSourceFieldBuilder();

  EnumSourceFieldBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _parsedLibrary = $v.parsedLibrary;
      _element = $v.element;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnumSourceField other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EnumSourceField;
  }

  @override
  void update(void Function(EnumSourceFieldBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EnumSourceField build() => _build();

  _$EnumSourceField _build() {
    final _$result = _$v ??
        new _$EnumSourceField._(
            parsedLibrary: BuiltValueNullFieldError.checkNotNull(
                parsedLibrary, 'EnumSourceField', 'parsedLibrary'),
            element: BuiltValueNullFieldError.checkNotNull(
                element, 'EnumSourceField', 'element'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
