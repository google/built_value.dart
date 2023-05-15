// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'values.dart';

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

  factory _$SimpleValue([void Function(SimpleValueBuilder)? updates]) =>
      (new SimpleValueBuilder()..update(updates))._build();

  _$SimpleValue._(
      {required this.anInt,
      required this.list,
      required this.multimap,
      required this.map,
      required this.aSet,
      required this.setMultimap})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(anInt, r'SimpleValue', 'anInt');
    BuiltValueNullFieldError.checkNotNull(list, r'SimpleValue', 'list');
    BuiltValueNullFieldError.checkNotNull(multimap, r'SimpleValue', 'multimap');
    BuiltValueNullFieldError.checkNotNull(map, r'SimpleValue', 'map');
    BuiltValueNullFieldError.checkNotNull(aSet, r'SimpleValue', 'aSet');
    BuiltValueNullFieldError.checkNotNull(
        setMultimap, r'SimpleValue', 'setMultimap');
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
    var _$hash = 0;
    _$hash = $jc(_$hash, anInt.hashCode);
    _$hash = $jc(_$hash, list.hashCode);
    _$hash = $jc(_$hash, multimap.hashCode);
    _$hash = $jc(_$hash, map.hashCode);
    _$hash = $jc(_$hash, aSet.hashCode);
    _$hash = $jc(_$hash, setMultimap.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SimpleValue')
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
  _$SimpleValue? _$v;

  int? _anInt;
  int? get anInt => _$this._anInt;
  set anInt(int? anInt) => _$this._anInt = anInt;

  ListBuilder<String>? _list;
  ListBuilder<String> get list => _$this._list ??= new ListBuilder<String>();
  set list(ListBuilder<String>? list) => _$this._list = list;

  ListMultimapBuilder<int, bool>? _multimap;
  ListMultimapBuilder<int, bool> get multimap =>
      _$this._multimap ??= new ListMultimapBuilder<int, bool>();
  set multimap(ListMultimapBuilder<int, bool>? multimap) =>
      _$this._multimap = multimap;

  MapBuilder<String, int>? _map;
  MapBuilder<String, int> get map =>
      _$this._map ??= new MapBuilder<String, int>();
  set map(MapBuilder<String, int>? map) => _$this._map = map;

  SetBuilder<int>? _aSet;
  SetBuilder<int> get aSet => _$this._aSet ??= new SetBuilder<int>();
  set aSet(SetBuilder<int>? aSet) => _$this._aSet = aSet;

  SetMultimapBuilder<int, bool>? _setMultimap;
  SetMultimapBuilder<int, bool> get setMultimap =>
      _$this._setMultimap ??= new SetMultimapBuilder<int, bool>();
  set setMultimap(SetMultimapBuilder<int, bool>? setMultimap) =>
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
  void update(void Function(SimpleValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SimpleValue build() => _build();

  _$SimpleValue _build() {
    _$SimpleValue _$result;
    try {
      _$result = _$v ??
          new _$SimpleValue._(
              anInt: BuiltValueNullFieldError.checkNotNull(
                  anInt, r'SimpleValue', 'anInt'),
              list: list.build(),
              multimap: multimap.build(),
              map: map.build(),
              aSet: aSet.build(),
              setMultimap: setMultimap.build());
    } catch (_) {
      late String _$failedField;
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
            r'SimpleValue', _$failedField, e.toString());
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
  final String? string;

  factory _$CompoundValue([void Function(CompoundValueBuilder)? updates]) =>
      (new CompoundValueBuilder()..update(updates))._build();

  _$CompoundValue._({required this.simpleValue, this.string}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        simpleValue, r'CompoundValue', 'simpleValue');
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
    var _$hash = 0;
    _$hash = $jc(_$hash, simpleValue.hashCode);
    _$hash = $jc(_$hash, string.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CompoundValue')
          ..add('simpleValue', simpleValue)
          ..add('string', string))
        .toString();
  }
}

class CompoundValueBuilder
    implements Builder<CompoundValue, CompoundValueBuilder> {
  _$CompoundValue? _$v;

  SimpleValueBuilder? _simpleValue;
  SimpleValueBuilder get simpleValue =>
      _$this._simpleValue ??= new SimpleValueBuilder();
  set simpleValue(SimpleValueBuilder? simpleValue) =>
      _$this._simpleValue = simpleValue;

  String? _string;
  String? get string => _$this._string;
  set string(String? string) => _$this._string = string;

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
  void update(void Function(CompoundValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompoundValue build() => _build();

  _$CompoundValue _build() {
    _$CompoundValue _$result;
    try {
      _$result = _$v ??
          new _$CompoundValue._(
              simpleValue: simpleValue.build(), string: string);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'simpleValue';
        simpleValue.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CompoundValue', _$failedField, e.toString());
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

  factory _$ComparedValue([void Function(ComparedValueBuilder)? updates]) =>
      (new ComparedValueBuilder()..update(updates))._build();

  _$ComparedValue._({required this.name, required this.onChanged}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'ComparedValue', 'name');
    BuiltValueNullFieldError.checkNotNull(
        onChanged, r'ComparedValue', 'onChanged');
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
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ComparedValue')
          ..add('name', name)
          ..add('onChanged', onChanged))
        .toString();
  }
}

class ComparedValueBuilder
    implements Builder<ComparedValue, ComparedValueBuilder> {
  _$ComparedValue? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  Function? _onChanged;
  Function? get onChanged => _$this._onChanged;
  set onChanged(Function? onChanged) => _$this._onChanged = onChanged;

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
  void update(void Function(ComparedValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ComparedValue build() => _build();

  _$ComparedValue _build() {
    final _$result = _$v ??
        new _$ComparedValue._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'ComparedValue', 'name'),
            onChanged: BuiltValueNullFieldError.checkNotNull(
                onChanged, r'ComparedValue', 'onChanged'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
