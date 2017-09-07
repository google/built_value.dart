// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.source_field;

// **************************************************************************
// Generator: BuiltValueGenerator
// **************************************************************************

// ignore_for_file: annotate_overrides
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
  bool __isNullable;
  String __name;
  String __type;
  bool __builderFieldUsesNestedBuilder;
  String __rawType;

  factory _$SerializerSourceField(
          [void updates(SerializerSourceFieldBuilder b)]) =>
      (new SerializerSourceFieldBuilder()..update(updates)).build();

  _$SerializerSourceField._({this.settings, this.element, this.builderElement})
      : super._() {
    if (settings == null) throw new ArgumentError.notNull('settings');
    if (element == null) throw new ArgumentError.notNull('element');
  }

  @override
  bool get isSerializable => __isSerializable ??= super.isSerializable;

  @override
  bool get isNullable => __isNullable ??= super.isNullable;

  @override
  String get name => __name ??= super.name;

  @override
  String get type => __type ??= super.type;

  @override
  bool get builderFieldUsesNestedBuilder =>
      __builderFieldUsesNestedBuilder ??= super.builderFieldUsesNestedBuilder;

  @override
  String get rawType => __rawType ??= super.rawType;

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
