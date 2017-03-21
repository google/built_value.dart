// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.source_field;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class ValueSourceField
// **************************************************************************

class _$ValueSourceField extends ValueSourceField {
  @override
  final String name;
  @override
  final String type;
  @override
  final bool isGetter;
  @override
  final bool isNullable;
  @override
  final bool builderFieldExists;
  @override
  final bool builderFieldIsNormalField;
  @override
  final String typeInBuilder;
  @override
  final bool isNestedBuilder;

  factory _$ValueSourceField([void updates(ValueSourceFieldBuilder b)]) =>
      (new ValueSourceFieldBuilder()..update(updates)).build();

  _$ValueSourceField._(
      {this.name,
      this.type,
      this.isGetter,
      this.isNullable,
      this.builderFieldExists,
      this.builderFieldIsNormalField,
      this.typeInBuilder,
      this.isNestedBuilder})
      : super._() {
    if (name == null) throw new ArgumentError.notNull('name');
    if (type == null) throw new ArgumentError.notNull('type');
    if (isGetter == null) throw new ArgumentError.notNull('isGetter');
    if (isNullable == null) throw new ArgumentError.notNull('isNullable');
    if (builderFieldExists == null)
      throw new ArgumentError.notNull('builderFieldExists');
    if (builderFieldIsNormalField == null)
      throw new ArgumentError.notNull('builderFieldIsNormalField');
    if (typeInBuilder == null) throw new ArgumentError.notNull('typeInBuilder');
    if (isNestedBuilder == null)
      throw new ArgumentError.notNull('isNestedBuilder');
  }

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
    return name == other.name &&
        type == other.type &&
        isGetter == other.isGetter &&
        isNullable == other.isNullable &&
        builderFieldExists == other.builderFieldExists &&
        builderFieldIsNormalField == other.builderFieldIsNormalField &&
        typeInBuilder == other.typeInBuilder &&
        isNestedBuilder == other.isNestedBuilder;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, name.hashCode), type.hashCode),
                            isGetter.hashCode),
                        isNullable.hashCode),
                    builderFieldExists.hashCode),
                builderFieldIsNormalField.hashCode),
            typeInBuilder.hashCode),
        isNestedBuilder.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ValueSourceField')
          ..add('name', name)
          ..add('type', type)
          ..add('isGetter', isGetter)
          ..add('isNullable', isNullable)
          ..add('builderFieldExists', builderFieldExists)
          ..add('builderFieldIsNormalField', builderFieldIsNormalField)
          ..add('typeInBuilder', typeInBuilder)
          ..add('isNestedBuilder', isNestedBuilder))
        .toString();
  }
}

class ValueSourceFieldBuilder
    implements Builder<ValueSourceField, ValueSourceFieldBuilder> {
  _$ValueSourceField _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  bool _isGetter;
  bool get isGetter => _$this._isGetter;
  set isGetter(bool isGetter) => _$this._isGetter = isGetter;

  bool _isNullable;
  bool get isNullable => _$this._isNullable;
  set isNullable(bool isNullable) => _$this._isNullable = isNullable;

  bool _builderFieldExists;
  bool get builderFieldExists => _$this._builderFieldExists;
  set builderFieldExists(bool builderFieldExists) =>
      _$this._builderFieldExists = builderFieldExists;

  bool _builderFieldIsNormalField;
  bool get builderFieldIsNormalField => _$this._builderFieldIsNormalField;
  set builderFieldIsNormalField(bool builderFieldIsNormalField) =>
      _$this._builderFieldIsNormalField = builderFieldIsNormalField;

  String _typeInBuilder;
  String get typeInBuilder => _$this._typeInBuilder;
  set typeInBuilder(String typeInBuilder) =>
      _$this._typeInBuilder = typeInBuilder;

  bool _isNestedBuilder;
  bool get isNestedBuilder => _$this._isNestedBuilder;
  set isNestedBuilder(bool isNestedBuilder) =>
      _$this._isNestedBuilder = isNestedBuilder;

  ValueSourceFieldBuilder();

  ValueSourceFieldBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _type = _$v.type;
      _isGetter = _$v.isGetter;
      _isNullable = _$v.isNullable;
      _builderFieldExists = _$v.builderFieldExists;
      _builderFieldIsNormalField = _$v.builderFieldIsNormalField;
      _typeInBuilder = _$v.typeInBuilder;
      _isNestedBuilder = _$v.isNestedBuilder;
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
            name: name,
            type: type,
            isGetter: isGetter,
            isNullable: isNullable,
            builderFieldExists: builderFieldExists,
            builderFieldIsNormalField: builderFieldIsNormalField,
            typeInBuilder: typeInBuilder,
            isNestedBuilder: isNestedBuilder);
    replace(result);
    return result;
  }
}
