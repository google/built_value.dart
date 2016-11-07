// GENERATED CODE - DO NOT MODIFY BY HAND

part of validated_value;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class ValidatedValue
// **************************************************************************

class _$ValidatedValue extends ValidatedValue {
  final int anInt;
  final String aString;

  _$ValidatedValue._({this.anInt, this.aString}) : super._() {
    if (anInt == null) throw new ArgumentError.notNull('anInt');
  }

  factory _$ValidatedValue([updates(ValidatedValueBuilder b)]) =>
      (new ValidatedValueBuilder()..update(updates)).build();

  ValidatedValue rebuild(updates(ValidatedValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  ValidatedValueBuilder toBuilder() =>
      new ValidatedValueBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! ValidatedValue) return false;
    return anInt == other.anInt && aString == other.aString;
  }

  int get hashCode {
    return $jf($jc($jc(0, anInt.hashCode), aString.hashCode));
  }

  String toString() {
    return 'ValidatedValue {'
        'anInt=${anInt.toString()},\n'
        'aString=${aString.toString()},\n'
        '}';
  }
}

class ValidatedValueBuilder
    implements Builder<ValidatedValue, ValidatedValueBuilder> {
  ValidatedValueBuilder();
  int anInt;
  String aString;

  void replace(ValidatedValue other) {
    this.anInt = other.anInt;
    this.aString = other.aString;
  }

  void update(updates(ValidatedValueBuilder b)) {
    if (updates != null) updates(this);
  }

  ValidatedValue build() {
    return new _$ValidatedValue._(anInt: anInt, aString: aString);
  }
}
