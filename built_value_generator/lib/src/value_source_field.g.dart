// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.source_field;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_returning_this
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

class _$ValueSourceField extends ValueSourceField {
  @override
  final BuiltValue settings;
  @override
  final FieldElement element;
  @override
  final FieldElement builderElement;
  String __name;
  String __type;
  String __typeWithPrefix;
  bool __isGetter;
  bool __isNullable;
  BuiltValueField __builtValueField;
  bool __builderFieldExists;
  bool __builderFieldIsNormalField;
  String __buildElementType;
  bool __isNestedBuilder;

  factory _$ValueSourceField([void updates(ValueSourceFieldBuilder b)]) =>
      (new ValueSourceFieldBuilder()..update(updates)).build();

  _$ValueSourceField._({this.settings, this.element, this.builderElement})
      : super._() {
    if (settings == null)
      throw new BuiltValueNullFieldError('ValueSourceField', 'settings');
    if (element == null)
      throw new BuiltValueNullFieldError('ValueSourceField', 'element');
  }

  @override
  String get name => __name ??= super.name;

  @override
  String get type => __type ??= super.type;

  @override
  String get typeWithPrefix => __typeWithPrefix ??= super.typeWithPrefix;

  @override
  bool get isGetter => __isGetter ??= super.isGetter;

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
  String get buildElementType => __buildElementType ??= super.buildElementType;

  @override
  bool get isNestedBuilder => __isNestedBuilder ??= super.isNestedBuilder;

  @override
  ValueSourceField rebuild(void updates(ValueSourceFieldBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ValueSourceFieldBuilder toBuilder() =>
      new ValueSourceFieldBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ValueSourceField) return false;
    return settings == other.settings &&
        element == other.element &&
        builderElement == other.builderElement;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, settings.hashCode), element.hashCode),
        builderElement.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ValueSourceField')
          ..add('settings', settings)
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

  FieldElement _element;
  FieldElement get element => _$this._element;
  set element(FieldElement element) => _$this._element = element;

  FieldElement _builderElement;
  FieldElement get builderElement => _$this._builderElement;
  set builderElement(FieldElement builderElement) =>
      _$this._builderElement = builderElement;

  ValueSourceFieldBuilder();

  ValueSourceFieldBuilder get _$this {
    if (_$v != null) {
      _settings = _$v.settings;
      _element = _$v.element;
      _builderElement = _$v.builderElement;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueSourceField other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$ValueSourceField;
  }

  @override
  void update(void updates(ValueSourceFieldBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ValueSourceField build() {
    final _$result = _$v ??
        new _$ValueSourceField._(
            settings: settings,
            element: element,
            builderElement: builderElement);
    replace(_$result);
    return _$result;
  }
}
