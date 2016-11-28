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
  SerializerSourceField _$v;

  bool get isSerializable => super.isSerializable;
  set isSerializable(bool isSerializable) {
    _$writableBuilder;
    super.isSerializable = isSerializable;
  }

  bool get isNullable => super.isNullable;
  set isNullable(bool isNullable) {
    _$writableBuilder;
    super.isNullable = isNullable;
  }

  String get name => super.name;
  set name(String name) {
    _$writableBuilder;
    super.name = name;
  }

  String get type => super.type;
  set type(String type) {
    _$writableBuilder;
    super.type = type;
  }

  bool get builderFieldUsesNestedBuilder => super.builderFieldUsesNestedBuilder;
  set builderFieldUsesNestedBuilder(bool builderFieldUsesNestedBuilder) {
    _$writableBuilder;
    super.builderFieldUsesNestedBuilder = builderFieldUsesNestedBuilder;
  }

  _$SerializerSourceFieldBuilder() : super._();

  SerializerSourceFieldBuilder get _$writableBuilder {
    if (_$v != null) {
      super.isSerializable = _$v.isSerializable;
      super.isNullable = _$v.isNullable;
      super.name = _$v.name;
      super.type = _$v.type;
      super.builderFieldUsesNestedBuilder = _$v.builderFieldUsesNestedBuilder;
      _$v = null;
    }
    return this;
  }

  void replace(SerializerSourceField other) {
    _$v = other;
  }

  void update(updates(SerializerSourceFieldBuilder b)) {
    if (updates != null) updates(this);
  }

  SerializerSourceField build() {
    final result = _$v ??
        new _$SerializerSourceField._(
            isSerializable: isSerializable,
            isNullable: isNullable,
            name: name,
            type: type,
            builderFieldUsesNestedBuilder: builderFieldUsesNestedBuilder);
    replace(result);
    return result;
  }
}
