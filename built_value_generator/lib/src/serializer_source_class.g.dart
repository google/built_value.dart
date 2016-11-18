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

  _$SerializerSourceClassBuilder toBuilder() =>
      new _$SerializerSourceClassBuilder()..replace(this);

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

class _$SerializerSourceClassBuilder extends SerializerSourceClassBuilder {
  _$SerializerSourceClassBuilder() : super._();
  void replace(SerializerSourceClass other) {
    super.name = other.name;
    super.isBuiltValue = other.isBuiltValue;
    super.isEnumClass = other.isEnumClass;
    super.fields = other.fields?.toBuilder();
  }

  void update(updates(SerializerSourceClassBuilder b)) {
    if (updates != null) updates(this);
  }

  SerializerSourceClass build() {
    return new _$SerializerSourceClass._(
        name: name,
        isBuiltValue: isBuiltValue,
        isEnumClass: isEnumClass,
        fields: fields?.build());
  }
}
