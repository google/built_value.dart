// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.enum_source_class;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class EnumSourceClass
// **************************************************************************

class _$EnumSourceClass extends EnumSourceClass {
  @override
  final String name;
  @override
  final BuiltList<EnumSourceField> fields;
  @override
  final BuiltList<String> constructors;
  @override
  final String valuesIdentifier;
  @override
  final String valueOfIdentifier;
  @override
  final bool usesMixin;
  @override
  final String mixinDeclaration;

  factory _$EnumSourceClass([updates(EnumSourceClassBuilder b)]) =>
      (new EnumSourceClassBuilder()..update(updates)).build();

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

  @override
  EnumSourceClass rebuild(updates(EnumSourceClassBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  EnumSourceClassBuilder toBuilder() =>
      new EnumSourceClassBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! EnumSourceClass) return false;
    return name == other.name &&
        fields == other.fields &&
        constructors == other.constructors &&
        valuesIdentifier == other.valuesIdentifier &&
        valueOfIdentifier == other.valueOfIdentifier &&
        usesMixin == other.usesMixin &&
        mixinDeclaration == other.mixinDeclaration;
  }

  @override
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

  @override
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

class EnumSourceClassBuilder
    implements Builder<EnumSourceClass, EnumSourceClassBuilder> {
  EnumSourceClass _$v;

  String _name;
  String get name => _name;
  set name(String name) => _$writableBuilder._name = name;

  ListBuilder<EnumSourceField> _fields;
  ListBuilder<EnumSourceField> get fields =>
      _$writableBuilder._fields ??= new ListBuilder<EnumSourceField>();
  set fields(ListBuilder<EnumSourceField> fields) =>
      _$writableBuilder._fields = fields;

  ListBuilder<String> _constructors;
  ListBuilder<String> get constructors =>
      _$writableBuilder._constructors ??= new ListBuilder<String>();
  set constructors(ListBuilder<String> constructors) =>
      _$writableBuilder._constructors = constructors;

  String _valuesIdentifier;
  String get valuesIdentifier => _valuesIdentifier;
  set valuesIdentifier(String valuesIdentifier) =>
      _$writableBuilder._valuesIdentifier = valuesIdentifier;

  String _valueOfIdentifier;
  String get valueOfIdentifier => _valueOfIdentifier;
  set valueOfIdentifier(String valueOfIdentifier) =>
      _$writableBuilder._valueOfIdentifier = valueOfIdentifier;

  bool _usesMixin;
  bool get usesMixin => _usesMixin;
  set usesMixin(bool usesMixin) => _$writableBuilder._usesMixin = usesMixin;

  String _mixinDeclaration;
  String get mixinDeclaration => _mixinDeclaration;
  set mixinDeclaration(String mixinDeclaration) =>
      _$writableBuilder._mixinDeclaration = mixinDeclaration;

  EnumSourceClassBuilder();

  EnumSourceClassBuilder get _$writableBuilder {
    if (_$v != null) {
      _name = _$v.name;
      _fields = _$v.fields?.toBuilder();
      _constructors = _$v.constructors?.toBuilder();
      _valuesIdentifier = _$v.valuesIdentifier;
      _valueOfIdentifier = _$v.valueOfIdentifier;
      _usesMixin = _$v.usesMixin;
      _mixinDeclaration = _$v.mixinDeclaration;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnumSourceClass other) {
    _$v = other;
  }

  @override
  void update(updates(EnumSourceClassBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  EnumSourceClass build() {
    final result = _$v ??
        new _$EnumSourceClass._(
            name: name,
            fields: fields?.build(),
            constructors: constructors?.build(),
            valuesIdentifier: valuesIdentifier,
            valueOfIdentifier: valueOfIdentifier,
            usesMixin: usesMixin,
            mixinDeclaration: mixinDeclaration);
    replace(result);
    return result;
  }
}
