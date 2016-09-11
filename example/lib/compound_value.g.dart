// GENERATED CODE - DO NOT MODIFY BY HAND

part of compound_value;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class CompoundValue
// **************************************************************************

class _$CompoundValue extends CompoundValue {
  final SimpleValue simpleValue;
  final ValidatedValue validatedValue;

  _$CompoundValue._({this.simpleValue, this.validatedValue}) : super._() {
    if (simpleValue == null) throw new ArgumentError('null simpleValue');
  }

  factory _$CompoundValue([updates(CompoundValueBuilder b)]) =>
      (new CompoundValueBuilder()..update(updates)).build();

  CompoundValue rebuild(updates(CompoundValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  CompoundValueBuilder toBuilder() => new CompoundValueBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! CompoundValue) return false;
    return simpleValue == other.simpleValue &&
        validatedValue == other.validatedValue;
  }

  int get hashCode {
    return hashObjects([simpleValue, validatedValue]);
  }

  String toString() {
    return 'CompoundValue {'
        'simpleValue=${simpleValue.toString()},\n'
        'validatedValue=${validatedValue.toString()},\n'
        '}';
  }
}

class CompoundValueBuilder
    implements Builder<CompoundValue, CompoundValueBuilder> {
  CompoundValueBuilder();
  SimpleValueBuilder simpleValue = new SimpleValueBuilder();
  ValidatedValueBuilder validatedValue;

  void replace(CompoundValue other) {
    this.simpleValue = other.simpleValue?.toBuilder();
    this.validatedValue = other.validatedValue?.toBuilder();
  }

  void update(updates(CompoundValueBuilder b)) {
    if (updates != null) updates(this);
  }

  CompoundValue build() {
    return new _$CompoundValue._(
        simpleValue: simpleValue?.build(),
        validatedValue: validatedValue?.build());
  }
}
