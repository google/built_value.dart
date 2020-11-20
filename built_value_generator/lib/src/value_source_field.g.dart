// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.11

part of built_value_generator.source_field;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ValueSourceField extends ValueSourceField {
  @override
  final BuiltValue settings;
  @override
  final ParsedLibraryResult parsedLibrary;
  @override
  final FieldElement element;
  @override
  final FieldElement builderElement;
  String __name;
  bool __isNonNullByDefault;
  String __orNull;
  String __type;
  bool __isFunctionType;
  String __typeWithPrefix;
  bool __isGetter;
  bool __hasNullableAnnotation;
  bool __hasNullableType;
  bool __isNullable;
  BuiltValueField __builtValueField;
  bool __builderFieldExists;
  bool __builderFieldIsNormalField;
  bool __builderFieldIsGetterSetterPair;
  String __buildElementType;
  String __builderElementTypeWithPrefix;
  bool __isNestedBuilder;

  factory _$ValueSourceField(
          [void Function(ValueSourceFieldBuilder) updates]) =>
      (new ValueSourceFieldBuilder()..update(updates)).build();

  _$ValueSourceField._(
      {this.settings, this.parsedLibrary, this.element, this.builderElement})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        settings, 'ValueSourceField', 'settings');
    BuiltValueNullFieldError.checkNotNull(
        parsedLibrary, 'ValueSourceField', 'parsedLibrary');
    BuiltValueNullFieldError.checkNotNull(
        element, 'ValueSourceField', 'element');
  }

  @override
  String get name => __name ??= super.name;

  @override
  bool get isNonNullByDefault =>
      __isNonNullByDefault ??= super.isNonNullByDefault;

  @override
  String get orNull => __orNull ??= super.orNull;

  @override
  String get type => __type ??= super.type;

  @override
  bool get isFunctionType => __isFunctionType ??= super.isFunctionType;

  @override
  String get typeWithPrefix => __typeWithPrefix ??= super.typeWithPrefix;

  @override
  bool get isGetter => __isGetter ??= super.isGetter;

  @override
  bool get hasNullableAnnotation =>
      __hasNullableAnnotation ??= super.hasNullableAnnotation;

  @override
  bool get hasNullableType => __hasNullableType ??= super.hasNullableType;

  @override
  bool get isNullable => __isNullable ??= super.isNullable;

  @override
  BuiltValueField get builtValueField =>
      __builtValueField ??= super.builtValueField;

  @override
  bool get builderFieldExists =>
      __builderFieldExists ??= super.builderFieldExists;

  @override
  bool get builderFieldIsNormalField =>
      __builderFieldIsNormalField ??= super.builderFieldIsNormalField;

  @override
  bool get builderFieldIsGetterSetterPair =>
      __builderFieldIsGetterSetterPair ??= super.builderFieldIsGetterSetterPair;

  @override
  String get buildElementType => __buildElementType ??= super.buildElementType;

  @override
  String get builderElementTypeWithPrefix =>
      __builderElementTypeWithPrefix ??= super.builderElementTypeWithPrefix;

  @override
  bool get isNestedBuilder => __isNestedBuilder ??= super.isNestedBuilder;

  @override
  ValueSourceField rebuild(void Function(ValueSourceFieldBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValueSourceFieldBuilder toBuilder() =>
      new ValueSourceFieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValueSourceField &&
        settings == other.settings &&
        parsedLibrary == other.parsedLibrary &&
        element == other.element &&
        builderElement == other.builderElement;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, settings.hashCode), parsedLibrary.hashCode),
            element.hashCode),
        builderElement.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ValueSourceField')
          ..add('settings', settings)
          ..add('parsedLibrary', parsedLibrary)
          ..add('element', element)
          ..add('builderElement', builderElement))
        .toString();
  }
}

class ValueSourceFieldBuilder
    implements Builder<ValueSourceField, ValueSourceFieldBuilder> {
  _$ValueSourceField _$v;

  BuiltValue _settings;
  BuiltValue get settings => _$this._settings;
  set settings(BuiltValue settings) => _$this._settings = settings;

  ParsedLibraryResult _parsedLibrary;
  ParsedLibraryResult get parsedLibrary => _$this._parsedLibrary;
  set parsedLibrary(ParsedLibraryResult parsedLibrary) =>
      _$this._parsedLibrary = parsedLibrary;

  FieldElement _element;
  FieldElement get element => _$this._element;
  set element(FieldElement element) => _$this._element = element;

  FieldElement _builderElement;
  FieldElement get builderElement => _$this._builderElement;
  set builderElement(FieldElement builderElement) =>
      _$this._builderElement = builderElement;

  ValueSourceFieldBuilder();

  ValueSourceFieldBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _settings = $v.settings;
      _parsedLibrary = $v.parsedLibrary;
      _element = $v.element;
      _builderElement = $v.builderElement;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueSourceField other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ValueSourceField;
  }

  @override
  void update(void Function(ValueSourceFieldBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ValueSourceField build() {
    final _$result = _$v ??
        new _$ValueSourceField._(
            settings: BuiltValueNullFieldError.checkNotNull(
                settings, 'ValueSourceField', 'settings'),
            parsedLibrary: BuiltValueNullFieldError.checkNotNull(
                parsedLibrary, 'ValueSourceField', 'parsedLibrary'),
            element: BuiltValueNullFieldError.checkNotNull(
                element, 'ValueSourceField', 'element'),
            builderElement: builderElement);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
