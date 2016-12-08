// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.source_field;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class SerializerSourceField
// **************************************************************************

class _$SerializerSourceField extends SerializerSourceField {
  @override
  final bool isSerializable;
  @override
  final bool isNullable;
  @override
  final String name;
  @override
  final String type;
  @override
  final bool builderFieldUsesNestedBuilder;

  factory _$SerializerSourceField([updates(SerializerSourceFieldBuilder b)]) =>
      (new SerializerSourceFieldBuilder()..update(updates)).build();

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

  @override
  SerializerSourceField rebuild(updates(SerializerSourceFieldBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  _$SerializerSourceFieldBuilder toBuilder() =>
      new _$SerializerSourceFieldBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! SerializerSourceField) return false;
    return isSerializable == other.isSerializable &&
        isNullable == other.isNullable &&
        name == other.name &&
        type == other.type &&
        builderFieldUsesNestedBuilder == other.builderFieldUsesNestedBuilder;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, isSerializable.hashCode), isNullable.hashCode),
                name.hashCode),
            type.hashCode),
        builderFieldUsesNestedBuilder.hashCode));
  }

  @override
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

  @override
  bool get isSerializable {
    _$this;
    return super.isSerializable;
  }

  @override
  set isSerializable(bool isSerializable) {
    _$this;
    super.isSerializable = isSerializable;
  }

  @override
  bool get isNullable {
    _$this;
    return super.isNullable;
  }

  @override
  set isNullable(bool isNullable) {
    _$this;
    super.isNullable = isNullable;
  }

  @override
  String get name {
    _$this;
    return super.name;
  }

  @override
  set name(String name) {
    _$this;
    super.name = name;
  }

  @override
  String get type {
    _$this;
    return super.type;
  }

  @override
  set type(String type) {
    _$this;
    super.type = type;
  }

  @override
  bool get builderFieldUsesNestedBuilder {
    _$this;
    return super.builderFieldUsesNestedBuilder;
  }

  @override
  set builderFieldUsesNestedBuilder(bool builderFieldUsesNestedBuilder) {
    _$this;
    super.builderFieldUsesNestedBuilder = builderFieldUsesNestedBuilder;
  }

  _$SerializerSourceFieldBuilder() : super._();

  SerializerSourceFieldBuilder get _$this {
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

  @override
  void replace(SerializerSourceField other) {
    _$v = other;
  }

  @override
  void update(updates(SerializerSourceFieldBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
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
