// GENERATED CODE - DO NOT MODIFY BY HAND

part of memoization;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class DerivedValue
// **************************************************************************

class _$DerivedValue extends DerivedValue {
  @override
  final int anInt;
  int __derivedValue;
  Iterable<String> __derivedString;

  factory _$DerivedValue([updates(DerivedValueBuilder b)]) =>
      (new DerivedValueBuilder()..update(updates)).build();

  _$DerivedValue._({this.anInt}) : super._() {
    if (anInt == null) throw new ArgumentError.notNull('anInt');
  }

  @override
  int get derivedValue => __derivedValue ??= super.derivedValue;

  @override
  Iterable<String> get derivedString => __derivedString ??= super.derivedString;

  @override
  DerivedValue rebuild(updates(DerivedValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DerivedValueBuilder toBuilder() => new DerivedValueBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! DerivedValue) return false;
    return anInt == other.anInt;
  }

  @override
  int get hashCode {
    return $jf($jc(0, anInt.hashCode));
  }

  @override
  String toString() {
    return 'DerivedValue {'
        'anInt=${anInt.toString()},\n'
        '}';
  }
}

class DerivedValueBuilder
    implements Builder<DerivedValue, DerivedValueBuilder> {
  DerivedValue _$v;

  int _anInt;
  int get anInt => _$this._anInt;
  set anInt(int anInt) => _$this._anInt = anInt;

  DerivedValueBuilder();

  DerivedValueBuilder get _$this {
    if (_$v != null) {
      _anInt = _$v.anInt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DerivedValue other) {
    _$v = other;
  }

  @override
  void update(updates(DerivedValueBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  DerivedValue build() {
    final result = _$v ?? new _$DerivedValue._(anInt: anInt);
    replace(result);
    return result;
  }
}
