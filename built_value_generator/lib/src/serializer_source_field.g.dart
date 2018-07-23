// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.source_field;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

class _$SerializerSourceField extends SerializerSourceField {
  @override
  final BuiltValue settings;
  @override
  final FieldElement element;
  @override
  final FieldElement builderElement;
  bool __isSerializable;
  BuiltValueField __builtValueField;
  bool __isNullable;
  String __name;
  String __wireName;
  String __type;
  String __typeWithPrefix;
  bool __builderFieldUsesNestedBuilder;
  String __rawType;
  bool __needsBuilder;

  factory _$SerializerSourceField(
          [void updates(SerializerSourceFieldBuilder b)]) =>
      (new SerializerSourceFieldBuilder()..update(updates)).build();

  _$SerializerSourceField._({this.settings, this.element, this.builderElement})
      : super._() {
    if (settings == null)
      throw new BuiltValueNullFieldError('SerializerSourceField', 'settings');
    if (element == null)
      throw new BuiltValueNullFieldError('SerializerSourceField', 'element');
  }

  @override
  bool get isSerializable => __isSerializable ??= super.isSerializable;

  @override
  BuiltValueField get builtValueField =>
      __builtValueField ??= super.builtValueField;

  @override
  bool get isNullable => __isNullable ??= super.isNullable;

  @override
  String get name => __name ??= super.name;

  @override
  String get wireName => __wireName ??= super.wireName;

  @override
  String get type => __type ??= super.type;

  @override
  String get typeWithPrefix => __typeWithPrefix ??= super.typeWithPrefix;

  @override
  bool get builderFieldUsesNestedBuilder =>
      __builderFieldUsesNestedBuilder ??= super.builderFieldUsesNestedBuilder;

  @override
  String get rawType => __rawType ??= super.rawType;

  @override
  bool get needsBuilder => __needsBuilder ??= super.needsBuilder;

  @override
  SerializerSourceField rebuild(void updates(SerializerSourceFieldBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SerializerSourceFieldBuilder toBuilder() =>
      new SerializerSourceFieldBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SerializerSourceField) return false;
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
    return (newBuiltValueToStringHelper('SerializerSourceField')
          ..add('settings', settings)
          ..add('element', element)
          ..add('builderElement', builderElement))
        .toString();
  }
}

class SerializerSourceFieldBuilder
    implements Builder<SerializerSourceField, SerializerSourceFieldBuilder> {
  _$SerializerSourceField _$v;

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

  SerializerSourceFieldBuilder();

  SerializerSourceFieldBuilder get _$this {
    if (_$v != null) {
      _settings = _$v.settings;
      _element = _$v.element;
      _builderElement = _$v.builderElement;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SerializerSourceField other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$SerializerSourceField;
  }

  @override
  void update(void updates(SerializerSourceFieldBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SerializerSourceField build() {
    final _$result = _$v ??
        new _$SerializerSourceField._(
            settings: settings,
            element: element,
            builderElement: builderElement);
    replace(_$result);
    return _$result;
  }
}
