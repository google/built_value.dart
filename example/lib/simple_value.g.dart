// GENERATED CODE - DO NOT MODIFY BY HAND

part of simple_value;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class SimpleValue
// **************************************************************************

class _$SimpleValue extends SimpleValue {
  final int anInt;
  final String aString;

  _$SimpleValue._({this.anInt, this.aString}) : super._() {
    if (anInt == null) throw new ArgumentError('null anInt');
  }

  factory _$SimpleValue([updates(SimpleValueBuilder b)]) =>
      (new SimpleValueBuilder()..update(updates)).build();

  SimpleValue rebuild(updates(SimpleValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  SimpleValueBuilder toBuilder() => new SimpleValueBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! SimpleValue) return false;
    return anInt == other.anInt && aString == other.aString;
  }

  int get hashCode {
    return hashObjects([anInt, aString]);
  }

  String toString() {
    return 'SimpleValue {'
        'anInt=${anInt.toString()},\n'
        'aString=${aString.toString()},\n'
        '}';
  }
}

class SimpleValueBuilder implements Builder<SimpleValue, SimpleValueBuilder> {
  SimpleValueBuilder();
  int anInt;
  String aString;

  void replace(SimpleValue other) {
    this.anInt = other.anInt;
    this.aString = other.aString;
  }

  void update(updates(SimpleValueBuilder b)) {
    if (updates != null) updates(this);
  }

  SimpleValue build() {
    return new _$SimpleValue._(anInt: anInt, aString: aString);
  }
}
