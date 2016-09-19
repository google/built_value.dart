// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.source_class;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class SourceClass
// **************************************************************************

class _$SourceClass extends SourceClass {
  final String name;
  final bool hasBuilder;
  final BuiltList<SourceField> fields;
  final String partStatement;
  final bool hasPartStatement;
  final bool valueClassIsAbstract;
  final BuiltList<String> valueClassConstructors;
  final BuiltList<String> valueClassFactories;
  final bool builderClassIsAbstract;
  final BuiltList<String> builderClassConstructors;
  final BuiltList<String> builderClassFactories;

  _$SourceClass._(
      {this.name,
      this.hasBuilder,
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
    if (name == null) throw new ArgumentError('null name');
    if (hasBuilder == null) throw new ArgumentError('null hasBuilder');
    if (fields == null) throw new ArgumentError('null fields');
    if (partStatement == null) throw new ArgumentError('null partStatement');
    if (hasPartStatement == null)
      throw new ArgumentError('null hasPartStatement');
    if (valueClassIsAbstract == null)
      throw new ArgumentError('null valueClassIsAbstract');
    if (valueClassConstructors == null)
      throw new ArgumentError('null valueClassConstructors');
    if (valueClassFactories == null)
      throw new ArgumentError('null valueClassFactories');
    if (builderClassIsAbstract == null)
      throw new ArgumentError('null builderClassIsAbstract');
    if (builderClassConstructors == null)
      throw new ArgumentError('null builderClassConstructors');
    if (builderClassFactories == null)
      throw new ArgumentError('null builderClassFactories');
  }

  factory _$SourceClass([updates(SourceClassBuilder b)]) =>
      (new SourceClassBuilder()..update(updates)).build();

  SourceClass rebuild(updates(SourceClassBuilder b)) =>
      (toBuilder()..update(updates)).build();

  _$SourceClassBuilder toBuilder() => new _$SourceClassBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! SourceClass) return false;
    return name == other.name &&
        hasBuilder == other.hasBuilder &&
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
    return hashObjects([
      name,
      hasBuilder,
      fields,
      partStatement,
      hasPartStatement,
      valueClassIsAbstract,
      valueClassConstructors,
      valueClassFactories,
      builderClassIsAbstract,
      builderClassConstructors,
      builderClassFactories
    ]);
  }

  String toString() {
    return 'SourceClass {'
        'name=${name.toString()},\n'
        'hasBuilder=${hasBuilder.toString()},\n'
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

class _$SourceClassBuilder extends SourceClassBuilder {
  _$SourceClassBuilder() : super._();
  void replace(SourceClass other) {
    super.name = other.name;
    super.hasBuilder = other.hasBuilder;
    super.fields = other.fields?.toBuilder();
    super.partStatement = other.partStatement;
    super.hasPartStatement = other.hasPartStatement;
    super.valueClassIsAbstract = other.valueClassIsAbstract;
    super.valueClassConstructors = other.valueClassConstructors?.toBuilder();
    super.valueClassFactories = other.valueClassFactories?.toBuilder();
    super.builderClassIsAbstract = other.builderClassIsAbstract;
    super.builderClassConstructors =
        other.builderClassConstructors?.toBuilder();
    super.builderClassFactories = other.builderClassFactories?.toBuilder();
  }

  void update(updates(SourceClassBuilder b)) {
    if (updates != null) updates(this);
  }

  SourceClass build() {
    return new _$SourceClass._(
        name: name,
        hasBuilder: hasBuilder,
        fields: fields?.build(),
        partStatement: partStatement,
        hasPartStatement: hasPartStatement,
        valueClassIsAbstract: valueClassIsAbstract,
        valueClassConstructors: valueClassConstructors?.build(),
        valueClassFactories: valueClassFactories?.build(),
        builderClassIsAbstract: builderClassIsAbstract,
        builderClassConstructors: builderClassConstructors?.build(),
        builderClassFactories: builderClassFactories?.build());
  }
}
