// GENERATED CODE - DO NOT MODIFY BY HAND

part of value_with_defaults;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class ValueWithDefaults
// **************************************************************************

class _$ValueWithDefaults extends ValueWithDefaults {
  final int anInt;
  final String aString;

  _$ValueWithDefaults._({this.anInt, this.aString}) : super._() {
    if (anInt == null) throw new ArgumentError.notNull('anInt');
  }

  factory _$ValueWithDefaults([updates(ValueWithDefaultsBuilder b)]) =>
      (new ValueWithDefaultsBuilder()..update(updates)).build();

  ValueWithDefaults rebuild(updates(ValueWithDefaultsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  _$ValueWithDefaultsBuilder toBuilder() =>
      new _$ValueWithDefaultsBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! ValueWithDefaults) return false;
    return anInt == other.anInt && aString == other.aString;
  }

  int get hashCode {
    return $jf($jc($jc(0, anInt.hashCode), aString.hashCode));
  }

  String toString() {
    return 'ValueWithDefaults {'
        'anInt=${anInt.toString()},\n'
        'aString=${aString.toString()},\n'
        '}';
  }
}

class _$ValueWithDefaultsBuilder extends ValueWithDefaultsBuilder {
  ValueWithDefaults _$v;

  int get anInt => super.anInt;
  set anInt(int anInt) {
    _$writableBuilder;
    super.anInt = anInt;
  }

  String get aString => super.aString;
  set aString(String aString) {
    _$writableBuilder;
    super.aString = aString;
  }

  _$ValueWithDefaultsBuilder() : super._();

  ValueWithDefaultsBuilder get _$writableBuilder {
    if (_$v != null) {
      super.anInt = _$v.anInt;
      super.aString = _$v.aString;
      _$v = null;
    }
    return this;
  }

  void replace(ValueWithDefaults other) {
    _$v = other;
  }

  void update(updates(ValueWithDefaultsBuilder b)) {
    if (updates != null) updates(this);
  }

  ValueWithDefaults build() {
    final result =
        _$v ?? new _$ValueWithDefaults._(anInt: anInt, aString: aString);
    replace(result);
    return result;
  }
}
