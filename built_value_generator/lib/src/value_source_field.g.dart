// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.source_field;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class ValueSourceField
// **************************************************************************

class _$ValueSourceField extends ValueSourceField {
  @override
  final FieldElement element;
  @override
  final FieldElement builderElement;
  String __name;
  String __type;
  bool __isGetter;
  bool __isNullable;
  bool __builderFieldExists;
  bool __builderFieldIsNormalField;
  String __typeInBuilder;
  bool __isNestedBuilder;

  factory _$ValueSourceField([void updates(ValueSourceFieldBuilder b)]) =>
      (new ValueSourceFieldBuilder()..update(updates)).build();

  _$ValueSourceField._({this.element, this.builderElement}) : super._() {
    if (element == null) throw new ArgumentError.notNull('element');
  }

  @override
  String get name => __name ??= super.name;

  @override
  String get type => __type ??= super.type;

  @override
  bool get isGetter => __isGetter ??= super.isGetter;

  @override
  bool get isNullable => __isNullable ??= super.isNullable;

  @override
  bool get builderFieldExists =>
      __builderFieldExists ??= super.builderFieldExists;

  @override
  bool get builderFieldIsNormalField =>
      __builderFieldIsNormalField ??= super.builderFieldIsNormalField;

  @override
  String get typeInBuilder => __typeInBuilder ??= super.typeInBuilder;

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
    return element == other.element && builderElement == other.builderElement;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, element.hashCode), builderElement.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ValueSourceField')
          ..add('element', element)
          ..add('builderElement', builderElement))
        .toString();
  }
}

class ValueSourceFieldBuilder
    implements Builder<ValueSourceField, ValueSourceFieldBuilder> {
  _$ValueSourceField _$v;

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
    final result = _$v ??
        new _$ValueSourceField._(
            element: element, builderElement: builderElement);
    replace(result);
    return result;
  }
}
