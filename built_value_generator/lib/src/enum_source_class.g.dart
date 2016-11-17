// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.enum_source_class;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class EnumSourceClass
// **************************************************************************

class _$EnumSourceClass extends EnumSourceClass {
  final String name;
  final BuiltList<EnumSourceField> fields;
  final BuiltList<String> constructors;
  final String valuesIdentifier;
  final String valueOfIdentifier;
  final bool usesMixin;
  final String mixinDeclaration;

  _$EnumSourceClass._(
      {this.name,
      this.fields,
      this.constructors,
      this.valuesIdentifier,
      this.valueOfIdentifier,
      this.usesMixin,
      this.mixinDeclaration})
      : super._() {
    if (name == null) throw new ArgumentError.notNull('name');
    if (fields == null) throw new ArgumentError.notNull('fields');
    if (constructors == null) throw new ArgumentError.notNull('constructors');
    if (usesMixin == null) throw new ArgumentError.notNull('usesMixin');
  }

  factory _$EnumSourceClass([updates(EnumSourceClassBuilder b)]) =>
      (new EnumSourceClassBuilder()..update(updates)).build();

  EnumSourceClass rebuild(updates(EnumSourceClassBuilder b)) =>
      (toBuilder()..update(updates)).build();

  _$EnumSourceClassBuilder toBuilder() =>
      new _$EnumSourceClassBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! EnumSourceClass) return false;
    return name == other.name &&
        fields == other.fields &&
        constructors == other.constructors &&
        valuesIdentifier == other.valuesIdentifier &&
        valueOfIdentifier == other.valueOfIdentifier &&
        usesMixin == other.usesMixin &&
        mixinDeclaration == other.mixinDeclaration;
  }

  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, name.hashCode), fields.hashCode),
                        constructors.hashCode),
                    valuesIdentifier.hashCode),
                valueOfIdentifier.hashCode),
            usesMixin.hashCode),
        mixinDeclaration.hashCode));
  }

  String toString() {
    return 'EnumSourceClass {'
        'name=${name.toString()},\n'
        'fields=${fields.toString()},\n'
        'constructors=${constructors.toString()},\n'
        'valuesIdentifier=${valuesIdentifier.toString()},\n'
        'valueOfIdentifier=${valueOfIdentifier.toString()},\n'
        'usesMixin=${usesMixin.toString()},\n'
        'mixinDeclaration=${mixinDeclaration.toString()},\n'
        '}';
  }
}

class _$EnumSourceClassBuilder extends EnumSourceClassBuilder {
  _$EnumSourceClassBuilder() : super._();
  void replace(EnumSourceClass other) {
    super.name = other.name;
    super.fields = other.fields?.toBuilder();
    super.constructors = other.constructors?.toBuilder();
    super.valuesIdentifier = other.valuesIdentifier;
    super.valueOfIdentifier = other.valueOfIdentifier;
    super.usesMixin = other.usesMixin;
    super.mixinDeclaration = other.mixinDeclaration;
  }

  void update(updates(EnumSourceClassBuilder b)) {
    if (updates != null) updates(this);
  }

  EnumSourceClass build() {
    return new _$EnumSourceClass._(
        name: name,
        fields: fields?.build(),
        constructors: constructors?.build(),
        valuesIdentifier: valuesIdentifier,
        valueOfIdentifier: valueOfIdentifier,
        usesMixin: usesMixin,
        mixinDeclaration: mixinDeclaration);
  }
}
