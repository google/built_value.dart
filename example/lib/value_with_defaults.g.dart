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
  _$ValueWithDefaultsBuilder() : super._();
  void replace(ValueWithDefaults other) {
    super.anInt = other.anInt;
    super.aString = other.aString;
  }

  void update(updates(ValueWithDefaultsBuilder b)) {
    if (updates != null) updates(this);
  }

  ValueWithDefaults build() {
    return new _$ValueWithDefaults._(anInt: anInt, aString: aString);
  }
}
