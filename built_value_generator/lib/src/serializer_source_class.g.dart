// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.source_class;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class SerializerSourceClass
// **************************************************************************

class _$SerializerSourceClass extends SerializerSourceClass {
  final String name;
  final bool isBuiltValue;
  final bool isEnumClass;
  final BuiltList<SerializerSourceField> fields;

  _$SerializerSourceClass._(
      {this.name, this.isBuiltValue, this.isEnumClass, this.fields})
      : super._() {
    if (name == null) throw new ArgumentError.notNull('name');
    if (isBuiltValue == null) throw new ArgumentError.notNull('isBuiltValue');
    if (isEnumClass == null) throw new ArgumentError.notNull('isEnumClass');
    if (fields == null) throw new ArgumentError.notNull('fields');
  }

  factory _$SerializerSourceClass([updates(SerializerSourceClassBuilder b)]) =>
      (new SerializerSourceClassBuilder()..update(updates)).build();

  SerializerSourceClass rebuild(updates(SerializerSourceClassBuilder b)) =>
      (toBuilder()..update(updates)).build();

  SerializerSourceClassBuilder toBuilder() =>
      new SerializerSourceClassBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! SerializerSourceClass) return false;
    return name == other.name &&
        isBuiltValue == other.isBuiltValue &&
        isEnumClass == other.isEnumClass &&
        fields == other.fields;
  }

  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), isBuiltValue.hashCode),
            isEnumClass.hashCode),
        fields.hashCode));
  }

  String toString() {
    return 'SerializerSourceClass {'
        'name=${name.toString()},\n'
        'isBuiltValue=${isBuiltValue.toString()},\n'
        'isEnumClass=${isEnumClass.toString()},\n'
        'fields=${fields.toString()},\n'
        '}';
  }
}

class SerializerSourceClassBuilder
    implements Builder<SerializerSourceClass, SerializerSourceClassBuilder> {
  SerializerSourceClass _$v;

  String _name;
  String get name => _name;
  set name(String name) => _$writableBuilder._name = name;

  bool _isBuiltValue;
  bool get isBuiltValue => _isBuiltValue;
  set isBuiltValue(bool isBuiltValue) =>
      _$writableBuilder._isBuiltValue = isBuiltValue;

  bool _isEnumClass;
  bool get isEnumClass => _isEnumClass;
  set isEnumClass(bool isEnumClass) =>
      _$writableBuilder._isEnumClass = isEnumClass;

  ListBuilder<SerializerSourceField> _fields;
  ListBuilder<SerializerSourceField> get fields =>
      _$writableBuilder._fields ??= new ListBuilder<SerializerSourceField>();
  set fields(ListBuilder<SerializerSourceField> fields) =>
      _$writableBuilder._fields = fields;

  SerializerSourceClassBuilder();

  SerializerSourceClassBuilder get _$writableBuilder {
    if (_$v != null) {
      _name = _$v.name;
      _isBuiltValue = _$v.isBuiltValue;
      _isEnumClass = _$v.isEnumClass;
      _fields = _$v.fields?.toBuilder();
      _$v = null;
    }
    return this;
  }

  void replace(SerializerSourceClass other) {
    _$v = other;
  }

  void update(updates(SerializerSourceClassBuilder b)) {
    if (updates != null) updates(this);
  }

  SerializerSourceClass build() {
    final result = _$v ??
        new _$SerializerSourceClass._(
            name: name,
            isBuiltValue: isBuiltValue,
            isEnumClass: isEnumClass,
            fields: fields?.build());
    replace(result);
    return result;
  }
}
