// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.source_class;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class ValueSourceClass
// **************************************************************************

class _$ValueSourceClass extends ValueSourceClass {
  final String name;
  final String builtParameters;
  final bool hasBuilder;
  final String builderParameters;
  final BuiltList<ValueSourceField> fields;
  final String partStatement;
  final bool hasPartStatement;
  final bool valueClassIsAbstract;
  final BuiltList<String> valueClassConstructors;
  final BuiltList<String> valueClassFactories;
  final bool builderClassIsAbstract;
  final BuiltList<String> builderClassConstructors;
  final BuiltList<String> builderClassFactories;

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

  factory _$ValueSourceClass([updates(ValueSourceClassBuilder b)]) =>
      (new ValueSourceClassBuilder()..update(updates)).build();

  ValueSourceClass rebuild(updates(ValueSourceClassBuilder b)) =>
      (toBuilder()..update(updates)).build();

  _$ValueSourceClassBuilder toBuilder() =>
      new _$ValueSourceClassBuilder()..replace(this);

  bool operator ==(other) {
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

  String get name => super.name;
  set name(String name) {
    _$writableBuilder;
    super.name = name;
  }

  String get builtParameters => super.builtParameters;
  set builtParameters(String builtParameters) {
    _$writableBuilder;
    super.builtParameters = builtParameters;
  }

  bool get hasBuilder => super.hasBuilder;
  set hasBuilder(bool hasBuilder) {
    _$writableBuilder;
    super.hasBuilder = hasBuilder;
  }

  String get builderParameters => super.builderParameters;
  set builderParameters(String builderParameters) {
    _$writableBuilder;
    super.builderParameters = builderParameters;
  }

  ListBuilder<ValueSourceField> get fields {
    _$writableBuilder;
    return super.fields ??= new ListBuilder<ValueSourceField>();
  }

  set fields(ListBuilder<ValueSourceField> fields) {
    _$writableBuilder;
    super.fields = fields;
  }

  String get partStatement => super.partStatement;
  set partStatement(String partStatement) {
    _$writableBuilder;
    super.partStatement = partStatement;
  }

  bool get hasPartStatement => super.hasPartStatement;
  set hasPartStatement(bool hasPartStatement) {
    _$writableBuilder;
    super.hasPartStatement = hasPartStatement;
  }

  bool get valueClassIsAbstract => super.valueClassIsAbstract;
  set valueClassIsAbstract(bool valueClassIsAbstract) {
    _$writableBuilder;
    super.valueClassIsAbstract = valueClassIsAbstract;
  }

  ListBuilder<String> get valueClassConstructors {
    _$writableBuilder;
    return super.valueClassConstructors ??= new ListBuilder<String>();
  }

  set valueClassConstructors(ListBuilder<String> valueClassConstructors) {
    _$writableBuilder;
    super.valueClassConstructors = valueClassConstructors;
  }

  ListBuilder<String> get valueClassFactories {
    _$writableBuilder;
    return super.valueClassFactories ??= new ListBuilder<String>();
  }

  set valueClassFactories(ListBuilder<String> valueClassFactories) {
    _$writableBuilder;
    super.valueClassFactories = valueClassFactories;
  }

  bool get builderClassIsAbstract => super.builderClassIsAbstract;
  set builderClassIsAbstract(bool builderClassIsAbstract) {
    _$writableBuilder;
    super.builderClassIsAbstract = builderClassIsAbstract;
  }

  ListBuilder<String> get builderClassConstructors {
    _$writableBuilder;
    return super.builderClassConstructors ??= new ListBuilder<String>();
  }

  set builderClassConstructors(ListBuilder<String> builderClassConstructors) {
    _$writableBuilder;
    super.builderClassConstructors = builderClassConstructors;
  }

  ListBuilder<String> get builderClassFactories {
    _$writableBuilder;
    return super.builderClassFactories ??= new ListBuilder<String>();
  }

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

  void replace(ValueSourceClass other) {
    _$v = other;
  }

  void update(updates(ValueSourceClassBuilder b)) {
    if (updates != null) updates(this);
  }

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
