// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.source_field;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class ValueSourceField
// **************************************************************************

class _$ValueSourceField extends ValueSourceField {
  final String name;
  final String type;
  final bool isGetter;
  final bool isNullable;
  final bool builderFieldExists;
  final bool builderFieldIsNormalField;
  final String typeInBuilder;
  final bool isNestedBuilder;

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

  factory _$ValueSourceField([updates(ValueSourceFieldBuilder b)]) =>
      (new ValueSourceFieldBuilder()..update(updates)).build();

  ValueSourceField rebuild(updates(ValueSourceFieldBuilder b)) =>
      (toBuilder()..update(updates)).build();

  ValueSourceFieldBuilder toBuilder() =>
      new ValueSourceFieldBuilder()..replace(this);

  bool operator ==(other) {
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

  String toString() {
    return 'ValueSourceField {'
        'name=${name.toString()},\n'
        'type=${type.toString()},\n'
        'isGetter=${isGetter.toString()},\n'
        'isNullable=${isNullable.toString()},\n'
        'builderFieldExists=${builderFieldExists.toString()},\n'
        'builderFieldIsNormalField=${builderFieldIsNormalField.toString()},\n'
        'typeInBuilder=${typeInBuilder.toString()},\n'
        'isNestedBuilder=${isNestedBuilder.toString()},\n'
        '}';
  }
}

class ValueSourceFieldBuilder
    implements Builder<ValueSourceField, ValueSourceFieldBuilder> {
  ValueSourceField _$v;

  String _name;
  String get name => _name;
  set name(String name) => _$writableBuilder._name = name;

  String _type;
  String get type => _type;
  set type(String type) => _$writableBuilder._type = type;

  bool _isGetter;
  bool get isGetter => _isGetter;
  set isGetter(bool isGetter) => _$writableBuilder._isGetter = isGetter;

  bool _isNullable;
  bool get isNullable => _isNullable;
  set isNullable(bool isNullable) => _$writableBuilder._isNullable = isNullable;

  bool _builderFieldExists;
  bool get builderFieldExists => _builderFieldExists;
  set builderFieldExists(bool builderFieldExists) =>
      _$writableBuilder._builderFieldExists = builderFieldExists;

  bool _builderFieldIsNormalField;
  bool get builderFieldIsNormalField => _builderFieldIsNormalField;
  set builderFieldIsNormalField(bool builderFieldIsNormalField) =>
      _$writableBuilder._builderFieldIsNormalField = builderFieldIsNormalField;

  String _typeInBuilder;
  String get typeInBuilder => _typeInBuilder;
  set typeInBuilder(String typeInBuilder) =>
      _$writableBuilder._typeInBuilder = typeInBuilder;

  bool _isNestedBuilder;
  bool get isNestedBuilder => _isNestedBuilder;
  set isNestedBuilder(bool isNestedBuilder) =>
      _$writableBuilder._isNestedBuilder = isNestedBuilder;

  ValueSourceFieldBuilder();

  ValueSourceFieldBuilder get _$writableBuilder {
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

  void replace(ValueSourceField other) {
    _$v = other;
  }

  void update(updates(ValueSourceFieldBuilder b)) {
    if (updates != null) updates(this);
  }

  ValueSourceField build() {
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
