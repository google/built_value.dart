// GENERATED CODE - DO NOT MODIFY BY HAND

part of simple_value;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class SimpleValue
// **************************************************************************

class _$SimpleValue extends SimpleValue {
  @override
  final int anInt;
  @override
  final String aString;

  factory _$SimpleValue([updates(SimpleValueBuilder b)]) =>
      (new SimpleValueBuilder()..update(updates)).build();

  _$SimpleValue._({this.anInt, this.aString}) : super._() {
    if (anInt == null) throw new ArgumentError.notNull('anInt');
    if (aString == null) throw new ArgumentError.notNull('aString');
  }

  @override
  SimpleValue rebuild(updates(SimpleValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SimpleValueBuilder toBuilder() => new SimpleValueBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! SimpleValue) return false;
    return anInt == other.anInt && aString == other.aString;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, anInt.hashCode), aString.hashCode));
  }

  @override
  String toString() {
    return 'SimpleValue {'
        'anInt=${anInt.toString()},\n'
        'aString=${aString.toString()},\n'
        '}';
  }
}

class SimpleValueBuilder implements Builder<SimpleValue, SimpleValueBuilder> {
  SimpleValue _$v;

  int _anInt;
  int get anInt => _$this._anInt;
  set anInt(int anInt) => _$this._anInt = anInt;

  String _aString;
  String get aString => _$this._aString;
  set aString(String aString) => _$this._aString = aString;

  SimpleValueBuilder();

  SimpleValueBuilder get _$this {
    if (_$v != null) {
      _anInt = _$v.anInt;
      _aString = _$v.aString;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SimpleValue other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other;
  }

  @override
  void update(updates(SimpleValueBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  SimpleValue build() {
    final result = _$v ?? new _$SimpleValue._(anInt: anInt, aString: aString);
    replace(result);
    return result;
  }
}
