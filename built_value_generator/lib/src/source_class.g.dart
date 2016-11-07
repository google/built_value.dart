// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.source_class;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class SourceClass
// **************************************************************************

class _$SourceClass extends SourceClass {
  final String name;
  final String builtParameters;
  final bool hasBuilder;
  final String builderParameters;
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

  factory _$SourceClass([updates(SourceClassBuilder b)]) =>
      (new SourceClassBuilder()..update(updates)).build();

  SourceClass rebuild(updates(SourceClassBuilder b)) =>
      (toBuilder()..update(updates)).build();

  _$SourceClassBuilder toBuilder() => new _$SourceClassBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! SourceClass) return false;
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
    return 'SourceClass {'
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

class _$SourceClassBuilder extends SourceClassBuilder {
  _$SourceClassBuilder() : super._();
  void replace(SourceClass other) {
    super.name = other.name;
    super.builtParameters = other.builtParameters;
    super.hasBuilder = other.hasBuilder;
    super.builderParameters = other.builderParameters;
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
  }
}
