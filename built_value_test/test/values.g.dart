// GENERATED CODE - DO NOT MODIFY BY HAND

part of values;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

class _$SimpleValue extends SimpleValue {
  @override
  final int anInt;
  @override
  final BuiltMap<String, int> map;

  factory _$SimpleValue([void updates(SimpleValueBuilder b)]) =>
      (new SimpleValueBuilder()..update(updates)).build();

  _$SimpleValue._({this.anInt, this.map}) : super._() {
    if (anInt == null)
      throw new BuiltValueNullFieldError('SimpleValue', 'anInt');
    if (map == null) throw new BuiltValueNullFieldError('SimpleValue', 'map');
  }

  @override
  SimpleValue rebuild(void updates(SimpleValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SimpleValueBuilder toBuilder() => new SimpleValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SimpleValue && anInt == other.anInt && map == other.map;
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
    _$SimpleValue _$result;
    try {
      _$result = _$v ?? new _$SimpleValue._(anInt: anInt, map: map.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'map';
        map.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SimpleValue', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CompoundValue extends CompoundValue {
  @override
  final SimpleValue simpleValue;
  @override
  final String string;

  factory _$CompoundValue([void updates(CompoundValueBuilder b)]) =>
      (new CompoundValueBuilder()..update(updates)).build();

  _$CompoundValue._({this.simpleValue, this.string}) : super._() {
    if (simpleValue == null)
      throw new BuiltValueNullFieldError('CompoundValue', 'simpleValue');
  }

  @override
  CompoundValue rebuild(void updates(CompoundValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CompoundValueBuilder toBuilder() => new CompoundValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompoundValue &&
        simpleValue == other.simpleValue &&
        string == other.string;
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
    _$CompoundValue _$result;
    try {
      _$result = _$v ??
          new _$CompoundValue._(
              simpleValue: simpleValue.build(), string: string);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'simpleValue';
        simpleValue.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CompoundValue', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ComparedValue extends ComparedValue {
  @override
  final String name;
  @override
  final Function onChanged;

  factory _$ComparedValue([void updates(ComparedValueBuilder b)]) =>
      (new ComparedValueBuilder()..update(updates)).build();

  _$ComparedValue._({this.name, this.onChanged}) : super._() {
    if (name == null)
      throw new BuiltValueNullFieldError('ComparedValue', 'name');
    if (onChanged == null)
      throw new BuiltValueNullFieldError('ComparedValue', 'onChanged');
  }

  @override
  ComparedValue rebuild(void updates(ComparedValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ComparedValueBuilder toBuilder() => new ComparedValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ComparedValue && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(0, name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ComparedValue')
          ..add('name', name)
          ..add('onChanged', onChanged))
        .toString();
  }
}

class ComparedValueBuilder
    implements Builder<ComparedValue, ComparedValueBuilder> {
  _$ComparedValue _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  Function _onChanged;
  Function get onChanged => _$this._onChanged;
  set onChanged(Function onChanged) => _$this._onChanged = onChanged;

  ComparedValueBuilder();

  ComparedValueBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _onChanged = _$v.onChanged;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ComparedValue other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$ComparedValue;
  }

  @override
  void update(void updates(ComparedValueBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ComparedValue build() {
    final _$result =
        _$v ?? new _$ComparedValue._(name: name, onChanged: onChanged);
    replace(_$result);
    return _$result;
  }
}
