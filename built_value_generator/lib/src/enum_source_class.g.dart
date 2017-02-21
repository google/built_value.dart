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
  final bool isAbstract;
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
      this.isAbstract,
      this.fields,
      this.constructors,
      this.valuesIdentifier,
      this.valueOfIdentifier,
      this.usesMixin,
      this.mixinDeclaration})
      : super._() {
    if (name == null) throw new ArgumentError.notNull('name');
    if (isAbstract == null) throw new ArgumentError.notNull('isAbstract');
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
    if (identical(other, this)) return true;
    if (other is! EnumSourceClass) return false;
    return name == other.name &&
        isAbstract == other.isAbstract &&
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
                    $jc(
                        $jc($jc($jc(0, name.hashCode), isAbstract.hashCode),
                            fields.hashCode),
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
        'isAbstract=${isAbstract.toString()},\n'
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
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  bool _isAbstract;
  bool get isAbstract => _$this._isAbstract;
  set isAbstract(bool isAbstract) => _$this._isAbstract = isAbstract;

  ListBuilder<EnumSourceField> _fields;
  ListBuilder<EnumSourceField> get fields =>
      _$this._fields ??= new ListBuilder<EnumSourceField>();
  set fields(ListBuilder<EnumSourceField> fields) => _$this._fields = fields;

  ListBuilder<String> _constructors;
  ListBuilder<String> get constructors =>
      _$this._constructors ??= new ListBuilder<String>();
  set constructors(ListBuilder<String> constructors) =>
      _$this._constructors = constructors;

  String _valuesIdentifier;
  String get valuesIdentifier => _$this._valuesIdentifier;
  set valuesIdentifier(String valuesIdentifier) =>
      _$this._valuesIdentifier = valuesIdentifier;

  String _valueOfIdentifier;
  String get valueOfIdentifier => _$this._valueOfIdentifier;
  set valueOfIdentifier(String valueOfIdentifier) =>
      _$this._valueOfIdentifier = valueOfIdentifier;

  bool _usesMixin;
  bool get usesMixin => _$this._usesMixin;
  set usesMixin(bool usesMixin) => _$this._usesMixin = usesMixin;

  String _mixinDeclaration;
  String get mixinDeclaration => _$this._mixinDeclaration;
  set mixinDeclaration(String mixinDeclaration) =>
      _$this._mixinDeclaration = mixinDeclaration;

  EnumSourceClassBuilder();

  EnumSourceClassBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _isAbstract = _$v.isAbstract;
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
    if (other == null) throw new ArgumentError.notNull('other');
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
            isAbstract: isAbstract,
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
