// GENERATED CODE - DO NOT MODIFY BY HAND

part of value_with_code;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class ValueWithCode
// **************************************************************************

class _$ValueWithCode extends ValueWithCode {
  final int anInt;
  final String aString;

  _$ValueWithCode._({this.anInt, this.aString}) : super._() {
    if (anInt == null) throw new ArgumentError('null anInt');
  }

  factory _$ValueWithCode([updates(ValueWithCodeBuilder b)]) =>
      (new ValueWithCodeBuilder()..update(updates)).build();

  ValueWithCode rebuild(updates(ValueWithCodeBuilder b)) =>
      (toBuilder()..update(updates)).build();

  ValueWithCodeBuilder toBuilder() => new ValueWithCodeBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! ValueWithCode) return false;
    return anInt == other.anInt && aString == other.aString;
  }

  int get hashCode {
    return hashObjects([anInt, aString]);
  }

  String toString() {
    return 'ValueWithCode {'
        'anInt=${anInt.toString()},\n'
        'aString=${aString.toString()},\n'
        '}';
  }
}

class ValueWithCodeBuilder
    implements Builder<ValueWithCode, ValueWithCodeBuilder> {
  ValueWithCodeBuilder();
  int anInt;
  String aString;

  void replace(ValueWithCode other) {
    this.anInt = other.anInt;
    this.aString = other.aString;
  }

  void update(updates(ValueWithCodeBuilder b)) {
    if (updates != null) updates(this);
  }

  ValueWithCode build() {
    return new _$ValueWithCode._(anInt: anInt, aString: aString);
  }
}
