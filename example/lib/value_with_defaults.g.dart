// GENERATED CODE - DO NOT MODIFY BY HAND

part of value_with_defaults;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class ValueWithDefaults
// **************************************************************************

class _$ValueWithDefaults extends ValueWithDefaults {
  @override
  final int anInt;
  @override
  final String aString;

  factory _$ValueWithDefaults([updates(ValueWithDefaultsBuilder b)]) =>
      (new ValueWithDefaultsBuilder()..update(updates)).build();

  _$ValueWithDefaults._({this.anInt, this.aString}) : super._() {
    if (anInt == null) throw new ArgumentError.notNull('anInt');
  }

  @override
  ValueWithDefaults rebuild(updates(ValueWithDefaultsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  _$ValueWithDefaultsBuilder toBuilder() =>
      new _$ValueWithDefaultsBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! ValueWithDefaults) return false;
    return anInt == other.anInt && aString == other.aString;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, anInt.hashCode), aString.hashCode));
  }

  @override
  String toString() {
    return 'ValueWithDefaults {'
        'anInt=${anInt.toString()},\n'
        'aString=${aString.toString()},\n'
        '}';
  }
}

class _$ValueWithDefaultsBuilder extends ValueWithDefaultsBuilder {
  ValueWithDefaults _$v;

  @override
  int get anInt {
    _$this;
    return super.anInt;
  }

  @override
  set anInt(int anInt) {
    _$this;
    super.anInt = anInt;
  }

  @override
  String get aString {
    _$this;
    return super.aString;
  }

  @override
  set aString(String aString) {
    _$this;
    super.aString = aString;
  }

  _$ValueWithDefaultsBuilder() : super._();

  ValueWithDefaultsBuilder get _$this {
    if (_$v != null) {
      super.anInt = _$v.anInt;
      super.aString = _$v.aString;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueWithDefaults other) {
    _$v = other;
  }

  @override
  void update(updates(ValueWithDefaultsBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  ValueWithDefaults build() {
    final result =
        _$v ?? new _$ValueWithDefaults._(anInt: anInt, aString: aString);
    replace(result);
    return result;
  }
}
