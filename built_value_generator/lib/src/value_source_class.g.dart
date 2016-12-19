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
  final BuiltList<String> genericParameters;
  @override
  final BuiltList<String> genericBounds;
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
  @override
  final BuiltList<MemoizedGetter> memoizedGetters;

  factory _$ValueSourceClass([updates(ValueSourceClassBuilder b)]) =>
      (new ValueSourceClassBuilder()..update(updates)).build();

  _$ValueSourceClass._(
      {this.name,
      this.genericParameters,
      this.genericBounds,
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
      this.builderClassFactories,
      this.memoizedGetters})
      : super._() {
    if (name == null) throw new ArgumentError.notNull('name');
    if (genericParameters == null)
      throw new ArgumentError.notNull('genericParameters');
    if (genericBounds == null) throw new ArgumentError.notNull('genericBounds');
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
    if (memoizedGetters == null)
      throw new ArgumentError.notNull('memoizedGetters');
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
        genericParameters == other.genericParameters &&
        genericBounds == other.genericBounds &&
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
        builderClassFactories == other.builderClassFactories &&
        memoizedGetters == other.memoizedGetters;
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
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    0,
                                                                    name
                                                                        .hashCode),
                                                                genericParameters
                                                                    .hashCode),
                                                            genericBounds
                                                                .hashCode),
                                                        builtParameters
                                                            .hashCode),
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
            builderClassFactories.hashCode),
        memoizedGetters.hashCode));
  }

  @override
  String toString() {
    return 'ValueSourceClass {'
        'name=${name.toString()},\n'
        'genericParameters=${genericParameters.toString()},\n'
        'genericBounds=${genericBounds.toString()},\n'
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
        'memoizedGetters=${memoizedGetters.toString()},\n'
        '}';
  }
}

class _$ValueSourceClassBuilder extends ValueSourceClassBuilder {
  ValueSourceClass _$v;

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
  ListBuilder<String> get genericParameters {
    _$this;
    return super.genericParameters ??= new ListBuilder<String>();
  }

  @override
  set genericParameters(ListBuilder<String> genericParameters) {
    _$this;
    super.genericParameters = genericParameters;
  }

  @override
  ListBuilder<String> get genericBounds {
    _$this;
    return super.genericBounds ??= new ListBuilder<String>();
  }

  @override
  set genericBounds(ListBuilder<String> genericBounds) {
    _$this;
    super.genericBounds = genericBounds;
  }

  @override
  String get builtParameters {
    _$this;
    return super.builtParameters;
  }

  @override
  set builtParameters(String builtParameters) {
    _$this;
    super.builtParameters = builtParameters;
  }

  @override
  bool get hasBuilder {
    _$this;
    return super.hasBuilder;
  }

  @override
  set hasBuilder(bool hasBuilder) {
    _$this;
    super.hasBuilder = hasBuilder;
  }

  @override
  String get builderParameters {
    _$this;
    return super.builderParameters;
  }

  @override
  set builderParameters(String builderParameters) {
    _$this;
    super.builderParameters = builderParameters;
  }

  @override
  ListBuilder<ValueSourceField> get fields {
    _$this;
    return super.fields ??= new ListBuilder<ValueSourceField>();
  }

  @override
  set fields(ListBuilder<ValueSourceField> fields) {
    _$this;
    super.fields = fields;
  }

  @override
  String get partStatement {
    _$this;
    return super.partStatement;
  }

  @override
  set partStatement(String partStatement) {
    _$this;
    super.partStatement = partStatement;
  }

  @override
  bool get hasPartStatement {
    _$this;
    return super.hasPartStatement;
  }

  @override
  set hasPartStatement(bool hasPartStatement) {
    _$this;
    super.hasPartStatement = hasPartStatement;
  }

  @override
  bool get valueClassIsAbstract {
    _$this;
    return super.valueClassIsAbstract;
  }

  @override
  set valueClassIsAbstract(bool valueClassIsAbstract) {
    _$this;
    super.valueClassIsAbstract = valueClassIsAbstract;
  }

  @override
  ListBuilder<String> get valueClassConstructors {
    _$this;
    return super.valueClassConstructors ??= new ListBuilder<String>();
  }

  @override
  set valueClassConstructors(ListBuilder<String> valueClassConstructors) {
    _$this;
    super.valueClassConstructors = valueClassConstructors;
  }

  @override
  ListBuilder<String> get valueClassFactories {
    _$this;
    return super.valueClassFactories ??= new ListBuilder<String>();
  }

  @override
  set valueClassFactories(ListBuilder<String> valueClassFactories) {
    _$this;
    super.valueClassFactories = valueClassFactories;
  }

  @override
  bool get builderClassIsAbstract {
    _$this;
    return super.builderClassIsAbstract;
  }

  @override
  set builderClassIsAbstract(bool builderClassIsAbstract) {
    _$this;
    super.builderClassIsAbstract = builderClassIsAbstract;
  }

  @override
  ListBuilder<String> get builderClassConstructors {
    _$this;
    return super.builderClassConstructors ??= new ListBuilder<String>();
  }

  @override
  set builderClassConstructors(ListBuilder<String> builderClassConstructors) {
    _$this;
    super.builderClassConstructors = builderClassConstructors;
  }

  @override
  ListBuilder<String> get builderClassFactories {
    _$this;
    return super.builderClassFactories ??= new ListBuilder<String>();
  }

  @override
  set builderClassFactories(ListBuilder<String> builderClassFactories) {
    _$this;
    super.builderClassFactories = builderClassFactories;
  }

  @override
  ListBuilder<MemoizedGetter> get memoizedGetters {
    _$this;
    return super.memoizedGetters ??= new ListBuilder<MemoizedGetter>();
  }

  @override
  set memoizedGetters(ListBuilder<MemoizedGetter> memoizedGetters) {
    _$this;
    super.memoizedGetters = memoizedGetters;
  }

  _$ValueSourceClassBuilder() : super._();

  ValueSourceClassBuilder get _$this {
    if (_$v != null) {
      super.name = _$v.name;
      super.genericParameters = _$v.genericParameters?.toBuilder();
      super.genericBounds = _$v.genericBounds?.toBuilder();
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
      super.memoizedGetters = _$v.memoizedGetters?.toBuilder();
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
            genericParameters: genericParameters?.build(),
            genericBounds: genericBounds?.build(),
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
            builderClassFactories: builderClassFactories?.build(),
            memoizedGetters: memoizedGetters?.build());
    replace(result);
    return result;
  }
}
