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

  _$ValueSourceFieldBuilder toBuilder() =>
      new _$ValueSourceFieldBuilder()..replace(this);

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

class _$ValueSourceFieldBuilder extends ValueSourceFieldBuilder {
  _$ValueSourceFieldBuilder() : super._();
  void replace(ValueSourceField other) {
    super.name = other.name;
    super.type = other.type;
    super.isGetter = other.isGetter;
    super.isNullable = other.isNullable;
    super.builderFieldExists = other.builderFieldExists;
    super.builderFieldIsNormalField = other.builderFieldIsNormalField;
    super.typeInBuilder = other.typeInBuilder;
    super.isNestedBuilder = other.isNestedBuilder;
  }

  void update(updates(ValueSourceFieldBuilder b)) {
    if (updates != null) updates(this);
  }

  ValueSourceField build() {
    return new _$ValueSourceField._(
        name: name,
        type: type,
        isGetter: isGetter,
        isNullable: isNullable,
        builderFieldExists: builderFieldExists,
        builderFieldIsNormalField: builderFieldIsNormalField,
        typeInBuilder: typeInBuilder,
        isNestedBuilder: isNestedBuilder);
  }
}
