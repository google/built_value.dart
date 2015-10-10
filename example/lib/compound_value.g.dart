// GENERATED CODE - DO NOT MODIFY BY HAND
// 2015-10-10T22:28:56.051Z

part of compound_value;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class CompoundValue
// **************************************************************************

class _$CompoundValue extends CompoundValue {
  final Value value;
  _$CompoundValue._({this.value}) : super._() {
    if (value == null) throw new ArgumentError('null value');
  }
  factory _$CompoundValue([updates(CompoundValueBuilder b)]) =>
      (new CompoundValueBuilder()..update(updates)).build();
  CompoundValue rebuild(updates(CompoundValueBuilder b)) =>
      (toBuilder()..update(updates)).build();
  _$CompoundValueBuilder toBuilder() =>
      new _$CompoundValueBuilder()..replace(this);
  bool operator ==(other) {
    if (other is! CompoundValue) return false;
    return value == other.value;
  }

  int get hashCode {
    return hashObjects([value]);
  }

  String toString() {
    return 'CompoundValue {'
        'value=${value.toString()}\n'
        '}';
  }
}

class _$CompoundValueBuilder extends CompoundValueBuilder {
  _$CompoundValueBuilder() : super._();
  ValueBuilder get value => super.value;
  void set value(ValueBuilder value) {
    if (value == null) throw new ArgumentError('null value');
    super.value = value;
  }

  void replace(CompoundValue other) {
    super.value = other.value.toBuilder();
  }

  void update(updates(CompoundValueBuilder b)) {
    if (updates != null) updates(this);
  }

  CompoundValue build() => new _$CompoundValue._(value: value.build());
}
