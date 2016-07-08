// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.source_field;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class SourceField
// **************************************************************************

class _$SourceField extends SourceField {
  final String name;
  final String type;
  final bool isGetter;
  final bool isNullable;
  final bool builderFieldExists;
  final bool builderFieldIsNormalField;
  final String typeInBuilder;
  final bool isNestedBuilder;
  _$SourceField._(
      {this.name,
      this.type,
      this.isGetter,
      this.isNullable,
      this.builderFieldExists,
      this.builderFieldIsNormalField,
      this.typeInBuilder,
      this.isNestedBuilder})
      : super._() {
    if (name == null) throw new ArgumentError('null name');
    if (type == null) throw new ArgumentError('null type');
    if (isGetter == null) throw new ArgumentError('null isGetter');
    if (isNullable == null) throw new ArgumentError('null isNullable');
    if (builderFieldExists == null)
      throw new ArgumentError('null builderFieldExists');
    if (builderFieldIsNormalField == null)
      throw new ArgumentError('null builderFieldIsNormalField');
    if (isNestedBuilder == null)
      throw new ArgumentError('null isNestedBuilder');
  }
  factory _$SourceField([updates(SourceFieldBuilder b)]) =>
      (new SourceFieldBuilder()..update(updates)).build();
  SourceField rebuild(updates(SourceFieldBuilder b)) =>
      (toBuilder()..update(updates)).build();
  _$SourceFieldBuilder toBuilder() => new _$SourceFieldBuilder()..replace(this);
  bool operator ==(other) {
    if (other is! SourceField) return false;
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
    return hashObjects([
      name,
      type,
      isGetter,
      isNullable,
      builderFieldExists,
      builderFieldIsNormalField,
      typeInBuilder,
      isNestedBuilder
    ]);
  }

  String toString() {
    return 'SourceField {'
        'name=${name.toString()}\n'
        'type=${type.toString()}\n'
        'isGetter=${isGetter.toString()}\n'
        'isNullable=${isNullable.toString()}\n'
        'builderFieldExists=${builderFieldExists.toString()}\n'
        'builderFieldIsNormalField=${builderFieldIsNormalField.toString()}\n'
        'typeInBuilder=${typeInBuilder.toString()}\n'
        'isNestedBuilder=${isNestedBuilder.toString()}\n'
        '}';
  }
}

class _$SourceFieldBuilder extends SourceFieldBuilder {
  _$SourceFieldBuilder() : super._();
  void replace(SourceField other) {
    super.name = other.name;
    super.type = other.type;
    super.isGetter = other.isGetter;
    super.isNullable = other.isNullable;
    super.builderFieldExists = other.builderFieldExists;
    super.builderFieldIsNormalField = other.builderFieldIsNormalField;
    super.typeInBuilder = other.typeInBuilder;
    super.isNestedBuilder = other.isNestedBuilder;
  }

  void update(updates(SourceFieldBuilder b)) {
    if (updates != null) updates(this);
  }

  SourceField build() {
    if (name == null) throw new ArgumentError('null name');
    if (type == null) throw new ArgumentError('null type');
    if (isGetter == null) throw new ArgumentError('null isGetter');
    if (isNullable == null) throw new ArgumentError('null isNullable');
    if (builderFieldExists == null)
      throw new ArgumentError('null builderFieldExists');
    if (builderFieldIsNormalField == null)
      throw new ArgumentError('null builderFieldIsNormalField');
    if (isNestedBuilder == null)
      throw new ArgumentError('null isNestedBuilder');
    return new _$SourceField._(
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
