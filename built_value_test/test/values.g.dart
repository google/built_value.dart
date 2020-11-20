// GENERATED CODE - DO NOT MODIFY BY HAND

part of values;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SimpleValue extends SimpleValue {
  @override
  final int anInt;
  @override
  final BuiltList<String> list;
  @override
  final BuiltListMultimap<int, bool> multimap;
  @override
  final BuiltMap<String, int> map;
  @override
  final BuiltSet<int> aSet;
  @override
  final BuiltSetMultimap<int, bool> setMultimap;

  factory _$SimpleValue([void Function(SimpleValueBuilder) updates]) =>
      (new SimpleValueBuilder()..update(updates)).build();

  _$SimpleValue._(
      {this.anInt,
      this.list,
      this.multimap,
      this.map,
      this.aSet,
      this.setMultimap})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(anInt, 'SimpleValue', 'anInt');
    BuiltValueNullFieldError.checkNotNull(list, 'SimpleValue', 'list');
    BuiltValueNullFieldError.checkNotNull(multimap, 'SimpleValue', 'multimap');
    BuiltValueNullFieldError.checkNotNull(map, 'SimpleValue', 'map');
    BuiltValueNullFieldError.checkNotNull(aSet, 'SimpleValue', 'aSet');
    BuiltValueNullFieldError.checkNotNull(
        setMultimap, 'SimpleValue', 'setMultimap');
  }

  @override
  SimpleValue rebuild(void Function(SimpleValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SimpleValueBuilder toBuilder() => new SimpleValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SimpleValue &&
        anInt == other.anInt &&
        list == other.list &&
        multimap == other.multimap &&
        map == other.map &&
        aSet == other.aSet &&
        setMultimap == other.setMultimap;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, anInt.hashCode), list.hashCode),
                    multimap.hashCode),
                map.hashCode),
            aSet.hashCode),
        setMultimap.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SimpleValue')
          ..add('anInt', anInt)
          ..add('list', list)
          ..add('multimap', multimap)
          ..add('map', map)
          ..add('aSet', aSet)
          ..add('setMultimap', setMultimap))
        .toString();
  }
}

class SimpleValueBuilder implements Builder<SimpleValue, SimpleValueBuilder> {
  _$SimpleValue _$v;

  int _anInt;
  int get anInt => _$this._anInt;
  set anInt(int anInt) => _$this._anInt = anInt;

  ListBuilder<String> _list;
  ListBuilder<String> get list => _$this._list ??= new ListBuilder<String>();
  set list(ListBuilder<String> list) => _$this._list = list;

  ListMultimapBuilder<int, bool> _multimap;
  ListMultimapBuilder<int, bool> get multimap =>
      _$this._multimap ??= new ListMultimapBuilder<int, bool>();
  set multimap(ListMultimapBuilder<int, bool> multimap) =>
      _$this._multimap = multimap;

  MapBuilder<String, int> _map;
  MapBuilder<String, int> get map =>
      _$this._map ??= new MapBuilder<String, int>();
  set map(MapBuilder<String, int> map) => _$this._map = map;

  SetBuilder<int> _aSet;
  SetBuilder<int> get aSet => _$this._aSet ??= new SetBuilder<int>();
  set aSet(SetBuilder<int> aSet) => _$this._aSet = aSet;

  SetMultimapBuilder<int, bool> _setMultimap;
  SetMultimapBuilder<int, bool> get setMultimap =>
      _$this._setMultimap ??= new SetMultimapBuilder<int, bool>();
  set setMultimap(SetMultimapBuilder<int, bool> setMultimap) =>
      _$this._setMultimap = setMultimap;

  SimpleValueBuilder();

  SimpleValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _anInt = $v.anInt;
      _list = $v.list.toBuilder();
      _multimap = $v.multimap.toBuilder();
      _map = $v.map.toBuilder();
      _aSet = $v.aSet.toBuilder();
      _setMultimap = $v.setMultimap.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SimpleValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SimpleValue;
  }

  @override
  void update(void Function(SimpleValueBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SimpleValue build() {
    _$SimpleValue _$result;
    try {
      _$result = _$v ??
          new _$SimpleValue._(
              anInt: BuiltValueNullFieldError.checkNotNull(
                  anInt, 'SimpleValue', 'anInt'),
              list: list.build(),
              multimap: multimap.build(),
              map: map.build(),
              aSet: aSet.build(),
              setMultimap: setMultimap.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'list';
        list.build();
        _$failedField = 'multimap';
        multimap.build();
        _$failedField = 'map';
        map.build();
        _$failedField = 'aSet';
        aSet.build();
        _$failedField = 'setMultimap';
        setMultimap.build();
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

  factory _$CompoundValue([void Function(CompoundValueBuilder) updates]) =>
      (new CompoundValueBuilder()..update(updates)).build();

  _$CompoundValue._({this.simpleValue, this.string}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        simpleValue, 'CompoundValue', 'simpleValue');
  }

  @override
  CompoundValue rebuild(void Function(CompoundValueBuilder) updates) =>
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
    final $v = _$v;
    if ($v != null) {
      _simpleValue = $v.simpleValue.toBuilder();
      _string = $v.string;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompoundValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompoundValue;
  }

  @override
  void update(void Function(CompoundValueBuilder) updates) {
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

  factory _$ComparedValue([void Function(ComparedValueBuilder) updates]) =>
      (new ComparedValueBuilder()..update(updates)).build();

  _$ComparedValue._({this.name, this.onChanged}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'ComparedValue', 'name');
    BuiltValueNullFieldError.checkNotNull(
        onChanged, 'ComparedValue', 'onChanged');
  }

  @override
  ComparedValue rebuild(void Function(ComparedValueBuilder) updates) =>
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
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _onChanged = $v.onChanged;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ComparedValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ComparedValue;
  }

  @override
  void update(void Function(ComparedValueBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ComparedValue build() {
    final _$result = _$v ??
        new _$ComparedValue._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'ComparedValue', 'name'),
            onChanged: BuiltValueNullFieldError.checkNotNull(
                onChanged, 'ComparedValue', 'onChanged'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
