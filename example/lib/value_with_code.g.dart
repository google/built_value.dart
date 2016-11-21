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
    if (anInt == null) throw new ArgumentError.notNull('anInt');
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
    return $jf($jc($jc(0, anInt.hashCode), aString.hashCode));
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
  ValueWithCode _$v;

  int _anInt;
  int get anInt => _anInt;
  set anInt(int anInt) => _$writableBuilder._anInt = anInt;

  String _aString;
  String get aString => _aString;
  set aString(String aString) => _$writableBuilder._aString = aString;

  ValueWithCodeBuilder();

  ValueWithCodeBuilder get _$writableBuilder {
    if (_$v != null) {
      _anInt = _$v.anInt;
      _aString = _$v.aString;
      _$v = null;
    }
    return this;
  }

  void replace(ValueWithCode other) {
    _$v = other;
  }

  void update(updates(ValueWithCodeBuilder b)) {
    if (updates != null) updates(this);
  }

  ValueWithCode build() {
    final result = _$v ?? new _$ValueWithCode._(anInt: anInt, aString: aString);
    replace(result);
    return result;
  }
}
