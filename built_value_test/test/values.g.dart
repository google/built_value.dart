// GENERATED CODE - DO NOT MODIFY BY HAND

part of values;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class SimpleValue
// **************************************************************************

// ignore_for_file: annotate_overrides
class _$SimpleValue extends SimpleValue {
  @override
  final int anInt;
  @override
  final BuiltMap<String, int> map;

  factory _$SimpleValue([void updates(SimpleValueBuilder b)]) =>
      (new SimpleValueBuilder()..update(updates)).build();

  _$SimpleValue._({this.anInt, this.map}) : super._() {
    if (anInt == null) throw new ArgumentError.notNull('anInt');
    if (map == null) throw new ArgumentError.notNull('map');
  }

  @override
  SimpleValue rebuild(void updates(SimpleValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SimpleValueBuilder toBuilder() => new SimpleValueBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! SimpleValue) return false;
    return anInt == other.anInt && map == other.map;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, anInt.hashCode), map.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SimpleValue')
          ..add('anInt', anInt)
          ..add('map', map))
        .toString();
  }
}

class SimpleValueBuilder implements Builder<SimpleValue, SimpleValueBuilder> {
  _$SimpleValue _$v;

  int _anInt;
  int get anInt => _$this._anInt;
  set anInt(int anInt) => _$this._anInt = anInt;

  MapBuilder<String, int> _map;
  MapBuilder<String, int> get map =>
      _$this._map ??= new MapBuilder<String, int>();
  set map(MapBuilder<String, int> map) => _$this._map = map;

  SimpleValueBuilder();

  SimpleValueBuilder get _$this {
    if (_$v != null) {
      _anInt = _$v.anInt;
      _map = _$v.map?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SimpleValue other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$SimpleValue;
  }

  @override
  void update(void updates(SimpleValueBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SimpleValue build() {
    final result = _$v ?? new _$SimpleValue._(anInt: anInt, map: map?.build());
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class CompoundValue
// **************************************************************************

// ignore_for_file: annotate_overrides
class _$CompoundValue extends CompoundValue {
  @override
  final SimpleValue simpleValue;
  @override
  final String string;

  factory _$CompoundValue([void updates(CompoundValueBuilder b)]) =>
      (new CompoundValueBuilder()..update(updates)).build();

  _$CompoundValue._({this.simpleValue, this.string}) : super._() {
    if (simpleValue == null) throw new ArgumentError.notNull('simpleValue');
  }

  @override
  CompoundValue rebuild(void updates(CompoundValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CompoundValueBuilder toBuilder() => new CompoundValueBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! CompoundValue) return false;
    return simpleValue == other.simpleValue && string == other.string;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, simpleValue.hashCode), string.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CompoundValue')
          ..add('simpleValue', simpleValue)
          ..add('string', string))
        .toString();
  }
}

class CompoundValueBuilder
    implements Builder<CompoundValue, CompoundValueBuilder> {
  _$CompoundValue _$v;

  SimpleValueBuilder _simpleValue;
  SimpleValueBuilder get simpleValue =>
      _$this._simpleValue ??= new SimpleValueBuilder();
  set simpleValue(SimpleValueBuilder simpleValue) =>
      _$this._simpleValue = simpleValue;

  String _string;
  String get string => _$this._string;
  set string(String string) => _$this._string = string;

  CompoundValueBuilder();

  CompoundValueBuilder get _$this {
    if (_$v != null) {
      _simpleValue = _$v.simpleValue?.toBuilder();
      _string = _$v.string;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompoundValue other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$CompoundValue;
  }

  @override
  void update(void updates(CompoundValueBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$CompoundValue build() {
    final result = _$v ??
        new _$CompoundValue._(
            simpleValue: simpleValue?.build(), string: string);
    replace(result);
    return result;
  }
}
