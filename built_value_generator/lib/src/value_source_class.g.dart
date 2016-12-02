// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.source_class;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class ValueSourceClass
// **************************************************************************

class _$ValueSourceClass extends ValueSourceClass {
  @override
  final String name;
  @override
  final String builtParameters;
  @override
  final bool hasBuilder;
  @override
  final String builderParameters;
  @override
  final BuiltList<ValueSourceField> fields;
  @override
  final String partStatement;
  @override
  final bool hasPartStatement;
  @override
  final bool valueClassIsAbstract;
  @override
  final BuiltList<String> valueClassConstructors;
  @override
  final BuiltList<String> valueClassFactories;
  @override
  final bool builderClassIsAbstract;
  @override
  final BuiltList<String> builderClassConstructors;
  @override
  final BuiltList<String> builderClassFactories;

  factory _$ValueSourceClass([updates(ValueSourceClassBuilder b)]) =>
      (new ValueSourceClassBuilder()..update(updates)).build();

  _$ValueSourceClass._(
      {this.name,
      this.builtParameters,
      this.hasBuilder,
      this.builderParameters,
      this.fields,
      this.partStatement,
      this.hasPartStatement,
      this.valueClassIsAbstract,
      this.valueClassConstructors,
      this.valueClassFactories,
      this.builderClassIsAbstract,
      this.builderClassConstructors,
      this.builderClassFactories})
      : super._() {
    if (name == null) throw new ArgumentError.notNull('name');
    if (builtParameters == null)
      throw new ArgumentError.notNull('builtParameters');
    if (hasBuilder == null) throw new ArgumentError.notNull('hasBuilder');
    if (builderParameters == null)
      throw new ArgumentError.notNull('builderParameters');
    if (fields == null) throw new ArgumentError.notNull('fields');
    if (partStatement == null) throw new ArgumentError.notNull('partStatement');
    if (hasPartStatement == null)
      throw new ArgumentError.notNull('hasPartStatement');
    if (valueClassIsAbstract == null)
      throw new ArgumentError.notNull('valueClassIsAbstract');
    if (valueClassConstructors == null)
      throw new ArgumentError.notNull('valueClassConstructors');
    if (valueClassFactories == null)
      throw new ArgumentError.notNull('valueClassFactories');
    if (builderClassIsAbstract == null)
      throw new ArgumentError.notNull('builderClassIsAbstract');
    if (builderClassConstructors == null)
      throw new ArgumentError.notNull('builderClassConstructors');
    if (builderClassFactories == null)
      throw new ArgumentError.notNull('builderClassFactories');
  }

  @override
  ValueSourceClass rebuild(updates(ValueSourceClassBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  _$ValueSourceClassBuilder toBuilder() =>
      new _$ValueSourceClassBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! ValueSourceClass) return false;
    return name == other.name &&
        builtParameters == other.builtParameters &&
        hasBuilder == other.hasBuilder &&
        builderParameters == other.builderParameters &&
        fields == other.fields &&
        partStatement == other.partStatement &&
        hasPartStatement == other.hasPartStatement &&
        valueClassIsAbstract == other.valueClassIsAbstract &&
        valueClassConstructors == other.valueClassConstructors &&
        valueClassFactories == other.valueClassFactories &&
        builderClassIsAbstract == other.builderClassIsAbstract &&
        builderClassConstructors == other.builderClassConstructors &&
        builderClassFactories == other.builderClassFactories;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, name.hashCode),
                                                    builtParameters.hashCode),
                                                hasBuilder.hashCode),
                                            builderParameters.hashCode),
                                        fields.hashCode),
                                    partStatement.hashCode),
                                hasPartStatement.hashCode),
                            valueClassIsAbstract.hashCode),
                        valueClassConstructors.hashCode),
                    valueClassFactories.hashCode),
                builderClassIsAbstract.hashCode),
            builderClassConstructors.hashCode),
        builderClassFactories.hashCode));
  }

  @override
  String toString() {
    return 'ValueSourceClass {'
        'name=${name.toString()},\n'
        'builtParameters=${builtParameters.toString()},\n'
        'hasBuilder=${hasBuilder.toString()},\n'
        'builderParameters=${builderParameters.toString()},\n'
        'fields=${fields.toString()},\n'
        'partStatement=${partStatement.toString()},\n'
        'hasPartStatement=${hasPartStatement.toString()},\n'
        'valueClassIsAbstract=${valueClassIsAbstract.toString()},\n'
        'valueClassConstructors=${valueClassConstructors.toString()},\n'
        'valueClassFactories=${valueClassFactories.toString()},\n'
        'builderClassIsAbstract=${builderClassIsAbstract.toString()},\n'
        'builderClassConstructors=${builderClassConstructors.toString()},\n'
        'builderClassFactories=${builderClassFactories.toString()},\n'
        '}';
  }
}

class _$ValueSourceClassBuilder extends ValueSourceClassBuilder {
  ValueSourceClass _$v;

  @override
  String get name => super.name;
  @override
  set name(String name) {
    _$writableBuilder;
    super.name = name;
  }

  @override
  String get builtParameters => super.builtParameters;
  @override
  set builtParameters(String builtParameters) {
    _$writableBuilder;
    super.builtParameters = builtParameters;
  }

  @override
  bool get hasBuilder => super.hasBuilder;
  @override
  set hasBuilder(bool hasBuilder) {
    _$writableBuilder;
    super.hasBuilder = hasBuilder;
  }

  @override
  String get builderParameters => super.builderParameters;
  @override
  set builderParameters(String builderParameters) {
    _$writableBuilder;
    super.builderParameters = builderParameters;
  }

  @override
  ListBuilder<ValueSourceField> get fields {
    _$writableBuilder;
    return super.fields ??= new ListBuilder<ValueSourceField>();
  }

  @override
  set fields(ListBuilder<ValueSourceField> fields) {
    _$writableBuilder;
    super.fields = fields;
  }

  @override
  String get partStatement => super.partStatement;
  @override
  set partStatement(String partStatement) {
    _$writableBuilder;
    super.partStatement = partStatement;
  }

  @override
  bool get hasPartStatement => super.hasPartStatement;
  @override
  set hasPartStatement(bool hasPartStatement) {
    _$writableBuilder;
    super.hasPartStatement = hasPartStatement;
  }

  @override
  bool get valueClassIsAbstract => super.valueClassIsAbstract;
  @override
  set valueClassIsAbstract(bool valueClassIsAbstract) {
    _$writableBuilder;
    super.valueClassIsAbstract = valueClassIsAbstract;
  }

  @override
  ListBuilder<String> get valueClassConstructors {
    _$writableBuilder;
    return super.valueClassConstructors ??= new ListBuilder<String>();
  }

  @override
  set valueClassConstructors(ListBuilder<String> valueClassConstructors) {
    _$writableBuilder;
    super.valueClassConstructors = valueClassConstructors;
  }

  @override
  ListBuilder<String> get valueClassFactories {
    _$writableBuilder;
    return super.valueClassFactories ??= new ListBuilder<String>();
  }

  @override
  set valueClassFactories(ListBuilder<String> valueClassFactories) {
    _$writableBuilder;
    super.valueClassFactories = valueClassFactories;
  }

  @override
  bool get builderClassIsAbstract => super.builderClassIsAbstract;
  @override
  set builderClassIsAbstract(bool builderClassIsAbstract) {
    _$writableBuilder;
    super.builderClassIsAbstract = builderClassIsAbstract;
  }

  @override
  ListBuilder<String> get builderClassConstructors {
    _$writableBuilder;
    return super.builderClassConstructors ??= new ListBuilder<String>();
  }

  @override
  set builderClassConstructors(ListBuilder<String> builderClassConstructors) {
    _$writableBuilder;
    super.builderClassConstructors = builderClassConstructors;
  }

  @override
  ListBuilder<String> get builderClassFactories {
    _$writableBuilder;
    return super.builderClassFactories ??= new ListBuilder<String>();
  }

  @override
  set builderClassFactories(ListBuilder<String> builderClassFactories) {
    _$writableBuilder;
    super.builderClassFactories = builderClassFactories;
  }

  _$ValueSourceClassBuilder() : super._();

  ValueSourceClassBuilder get _$writableBuilder {
    if (_$v != null) {
      super.name = _$v.name;
      super.builtParameters = _$v.builtParameters;
      super.hasBuilder = _$v.hasBuilder;
      super.builderParameters = _$v.builderParameters;
      super.fields = _$v.fields?.toBuilder();
      super.partStatement = _$v.partStatement;
      super.hasPartStatement = _$v.hasPartStatement;
      super.valueClassIsAbstract = _$v.valueClassIsAbstract;
      super.valueClassConstructors = _$v.valueClassConstructors?.toBuilder();
      super.valueClassFactories = _$v.valueClassFactories?.toBuilder();
      super.builderClassIsAbstract = _$v.builderClassIsAbstract;
      super.builderClassConstructors =
          _$v.builderClassConstructors?.toBuilder();
      super.builderClassFactories = _$v.builderClassFactories?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueSourceClass other) {
    _$v = other;
  }

  @override
  void update(updates(ValueSourceClassBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  ValueSourceClass build() {
    final result = _$v ??
        new _$ValueSourceClass._(
            name: name,
            builtParameters: builtParameters,
            hasBuilder: hasBuilder,
            builderParameters: builderParameters,
            fields: fields?.build(),
            partStatement: partStatement,
            hasPartStatement: hasPartStatement,
            valueClassIsAbstract: valueClassIsAbstract,
            valueClassConstructors: valueClassConstructors?.build(),
            valueClassFactories: valueClassFactories?.build(),
            builderClassIsAbstract: builderClassIsAbstract,
            builderClassConstructors: builderClassConstructors?.build(),
            builderClassFactories: builderClassFactories?.build());
    replace(result);
    return result;
  }
}
