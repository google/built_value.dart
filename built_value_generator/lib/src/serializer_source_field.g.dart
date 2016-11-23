// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.source_field;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class SerializerSourceField
// **************************************************************************

class _$SerializerSourceField extends SerializerSourceField {
  final bool isSerializable;
  final bool isNullable;
  final String name;
  final String type;
  final bool builderFieldUsesNestedBuilder;

  _$SerializerSourceField._(
      {this.isSerializable,
      this.isNullable,
      this.name,
      this.type,
      this.builderFieldUsesNestedBuilder})
      : super._() {
    if (isSerializable == null)
      throw new ArgumentError.notNull('isSerializable');
    if (isNullable == null) throw new ArgumentError.notNull('isNullable');
    if (name == null) throw new ArgumentError.notNull('name');
    if (type == null) throw new ArgumentError.notNull('type');
    if (builderFieldUsesNestedBuilder == null)
      throw new ArgumentError.notNull('builderFieldUsesNestedBuilder');
  }

  factory _$SerializerSourceField([updates(SerializerSourceFieldBuilder b)]) =>
      (new SerializerSourceFieldBuilder()..update(updates)).build();

  SerializerSourceField rebuild(updates(SerializerSourceFieldBuilder b)) =>
      (toBuilder()..update(updates)).build();

  _$SerializerSourceFieldBuilder toBuilder() =>
      new _$SerializerSourceFieldBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! SerializerSourceField) return false;
    return isSerializable == other.isSerializable &&
        isNullable == other.isNullable &&
        name == other.name &&
        type == other.type &&
        builderFieldUsesNestedBuilder == other.builderFieldUsesNestedBuilder;
  }

  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, isSerializable.hashCode), isNullable.hashCode),
                name.hashCode),
            type.hashCode),
        builderFieldUsesNestedBuilder.hashCode));
  }

  String toString() {
    return 'SerializerSourceField {'
        'isSerializable=${isSerializable.toString()},\n'
        'isNullable=${isNullable.toString()},\n'
        'name=${name.toString()},\n'
        'type=${type.toString()},\n'
        'builderFieldUsesNestedBuilder=${builderFieldUsesNestedBuilder.toString()},\n'
        '}';
  }
}

class _$SerializerSourceFieldBuilder extends SerializerSourceFieldBuilder {
  _$SerializerSourceFieldBuilder() : super._();
  void replace(SerializerSourceField other) {
    super.isSerializable = other.isSerializable;
    super.isNullable = other.isNullable;
    super.name = other.name;
    super.type = other.type;
    super.builderFieldUsesNestedBuilder = other.builderFieldUsesNestedBuilder;
  }

  void update(updates(SerializerSourceFieldBuilder b)) {
    if (updates != null) updates(this);
  }

  SerializerSourceField build() {
    return new _$SerializerSourceField._(
        isSerializable: isSerializable,
        isNullable: isNullable,
        name: name,
        type: type,
        builderFieldUsesNestedBuilder: builderFieldUsesNestedBuilder);
  }
}
