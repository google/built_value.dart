// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collections.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Collections> _$collectionsSerializer = _$CollectionsSerializer();

class _$CollectionsSerializer implements StructuredSerializer<Collections> {
  @override
  final Iterable<Type> types = const [Collections, _$Collections];
  @override
  final String wireName = 'Collections';

  @override
  Iterable<Object?> serialize(Serializers serializers, Collections object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'list',
      serializers.serialize(object.list,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
      'set',
      serializers.serialize(object.set,
          specifiedType:
              const FullType(BuiltSet, const [const FullType(String)])),
      'map',
      serializers.serialize(object.map,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(String), const FullType(int)])),
      'listMultimap',
      serializers.serialize(object.listMultimap,
          specifiedType: const FullType(BuiltListMultimap,
              const [const FullType(int), const FullType(bool)])),
      'setMultimap',
      serializers.serialize(object.setMultimap,
          specifiedType: const FullType(BuiltSetMultimap,
              const [const FullType(String), const FullType(bool)])),
    ];
    Object? value;
    value = object.nullableList;
    if (value != null) {
      result
        ..add('nullableList')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.nullableSet;
    if (value != null) {
      result
        ..add('nullableSet')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltSet, const [const FullType(String)])));
    }
    value = object.nullableMap;
    if (value != null) {
      result
        ..add('nullableMap')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(int)])));
    }
    value = object.nullableListMultimap;
    if (value != null) {
      result
        ..add('nullableListMultimap')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltListMultimap,
                const [const FullType(int), const FullType(bool)])));
    }
    value = object.nullableSetMultimap;
    if (value != null) {
      result
        ..add('nullableSetMultimap')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltSetMultimap,
                const [const FullType(String), const FullType(bool)])));
    }
    return result;
  }

  @override
  Collections deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = CollectionsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'list':
          result.list.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'set':
          result.set.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(String)]))!
              as BuiltSet<Object?>);
          break;
        case 'map':
          result.map.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(int)]))!);
          break;
        case 'listMultimap':
          result.listMultimap.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltListMultimap,
                  const [const FullType(int), const FullType(bool)]))!);
          break;
        case 'setMultimap':
          result.setMultimap.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltSetMultimap,
                  const [const FullType(String), const FullType(bool)]))!);
          break;
        case 'nullableList':
          result.nullableList.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'nullableSet':
          result.nullableSet.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(String)]))!
              as BuiltSet<Object?>);
          break;
        case 'nullableMap':
          result.nullableMap.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(int)]))!);
          break;
        case 'nullableListMultimap':
          result.nullableListMultimap.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltListMultimap,
                  const [const FullType(int), const FullType(bool)]))!);
          break;
        case 'nullableSetMultimap':
          result.nullableSetMultimap.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltSetMultimap,
                  const [const FullType(String), const FullType(bool)]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$Collections extends Collections {
  @override
  final BuiltList<int> list;
  @override
  final BuiltSet<String> set;
  @override
  final BuiltMap<String, int> map;
  @override
  final BuiltListMultimap<int, bool> listMultimap;
  @override
  final BuiltSetMultimap<String, bool> setMultimap;
  @override
  final BuiltList<int>? nullableList;
  @override
  final BuiltSet<String>? nullableSet;
  @override
  final BuiltMap<String, int>? nullableMap;
  @override
  final BuiltListMultimap<int, bool>? nullableListMultimap;
  @override
  final BuiltSetMultimap<String, bool>? nullableSetMultimap;

  factory _$Collections([void Function(CollectionsBuilder)? updates]) =>
      (CollectionsBuilder()..update(updates))._build();

  _$Collections._(
      {required this.list,
      required this.set,
      required this.map,
      required this.listMultimap,
      required this.setMultimap,
      this.nullableList,
      this.nullableSet,
      this.nullableMap,
      this.nullableListMultimap,
      this.nullableSetMultimap})
      : super._();
  @override
  Collections rebuild(void Function(CollectionsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollectionsBuilder toBuilder() => CollectionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Collections &&
        list == other.list &&
        set == other.set &&
        map == other.map &&
        listMultimap == other.listMultimap &&
        setMultimap == other.setMultimap &&
        nullableList == other.nullableList &&
        nullableSet == other.nullableSet &&
        nullableMap == other.nullableMap &&
        nullableListMultimap == other.nullableListMultimap &&
        nullableSetMultimap == other.nullableSetMultimap;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, list.hashCode);
    _$hash = $jc(_$hash, set.hashCode);
    _$hash = $jc(_$hash, map.hashCode);
    _$hash = $jc(_$hash, listMultimap.hashCode);
    _$hash = $jc(_$hash, setMultimap.hashCode);
    _$hash = $jc(_$hash, nullableList.hashCode);
    _$hash = $jc(_$hash, nullableSet.hashCode);
    _$hash = $jc(_$hash, nullableMap.hashCode);
    _$hash = $jc(_$hash, nullableListMultimap.hashCode);
    _$hash = $jc(_$hash, nullableSetMultimap.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Collections')
          ..add('list', list)
          ..add('set', set)
          ..add('map', map)
          ..add('listMultimap', listMultimap)
          ..add('setMultimap', setMultimap)
          ..add('nullableList', nullableList)
          ..add('nullableSet', nullableSet)
          ..add('nullableMap', nullableMap)
          ..add('nullableListMultimap', nullableListMultimap)
          ..add('nullableSetMultimap', nullableSetMultimap))
        .toString();
  }
}

class CollectionsBuilder implements Builder<Collections, CollectionsBuilder> {
  _$Collections? _$v;

  ListBuilder<int>? _list;
  ListBuilder<int> get list => _$this._list ??= ListBuilder<int>();
  set list(ListBuilder<int>? list) => _$this._list = list;

  SetBuilder<String>? _set;
  SetBuilder<String> get set => _$this._set ??= SetBuilder<String>();
  set set(SetBuilder<String>? set) => _$this._set = set;

  MapBuilder<String, int>? _map;
  MapBuilder<String, int> get map => _$this._map ??= MapBuilder<String, int>();
  set map(MapBuilder<String, int>? map) => _$this._map = map;

  ListMultimapBuilder<int, bool>? _listMultimap;
  ListMultimapBuilder<int, bool> get listMultimap =>
      _$this._listMultimap ??= ListMultimapBuilder<int, bool>();
  set listMultimap(ListMultimapBuilder<int, bool>? listMultimap) =>
      _$this._listMultimap = listMultimap;

  SetMultimapBuilder<String, bool>? _setMultimap;
  SetMultimapBuilder<String, bool> get setMultimap =>
      _$this._setMultimap ??= SetMultimapBuilder<String, bool>();
  set setMultimap(SetMultimapBuilder<String, bool>? setMultimap) =>
      _$this._setMultimap = setMultimap;

  ListBuilder<int>? _nullableList;
  ListBuilder<int> get nullableList =>
      _$this._nullableList ??= ListBuilder<int>();
  set nullableList(ListBuilder<int>? nullableList) =>
      _$this._nullableList = nullableList;

  SetBuilder<String>? _nullableSet;
  SetBuilder<String> get nullableSet =>
      _$this._nullableSet ??= SetBuilder<String>();
  set nullableSet(SetBuilder<String>? nullableSet) =>
      _$this._nullableSet = nullableSet;

  MapBuilder<String, int>? _nullableMap;
  MapBuilder<String, int> get nullableMap =>
      _$this._nullableMap ??= MapBuilder<String, int>();
  set nullableMap(MapBuilder<String, int>? nullableMap) =>
      _$this._nullableMap = nullableMap;

  ListMultimapBuilder<int, bool>? _nullableListMultimap;
  ListMultimapBuilder<int, bool> get nullableListMultimap =>
      _$this._nullableListMultimap ??= ListMultimapBuilder<int, bool>();
  set nullableListMultimap(
          ListMultimapBuilder<int, bool>? nullableListMultimap) =>
      _$this._nullableListMultimap = nullableListMultimap;

  SetMultimapBuilder<String, bool>? _nullableSetMultimap;
  SetMultimapBuilder<String, bool> get nullableSetMultimap =>
      _$this._nullableSetMultimap ??= SetMultimapBuilder<String, bool>();
  set nullableSetMultimap(
          SetMultimapBuilder<String, bool>? nullableSetMultimap) =>
      _$this._nullableSetMultimap = nullableSetMultimap;

  CollectionsBuilder();

  CollectionsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _list = $v.list.toBuilder();
      _set = $v.set.toBuilder();
      _map = $v.map.toBuilder();
      _listMultimap = $v.listMultimap.toBuilder();
      _setMultimap = $v.setMultimap.toBuilder();
      _nullableList = $v.nullableList?.toBuilder();
      _nullableSet = $v.nullableSet?.toBuilder();
      _nullableMap = $v.nullableMap?.toBuilder();
      _nullableListMultimap = $v.nullableListMultimap?.toBuilder();
      _nullableSetMultimap = $v.nullableSetMultimap?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Collections other) {
    _$v = other as _$Collections;
  }

  @override
  void update(void Function(CollectionsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Collections build() => _build();

  _$Collections _build() {
    _$Collections _$result;
    try {
      _$result = _$v ??
          _$Collections._(
            list: list.build(),
            set: set.build(),
            map: map.build(),
            listMultimap: listMultimap.build(),
            setMultimap: setMultimap.build(),
            nullableList: _nullableList?.build(),
            nullableSet: _nullableSet?.build(),
            nullableMap: _nullableMap?.build(),
            nullableListMultimap: _nullableListMultimap?.build(),
            nullableSetMultimap: _nullableSetMultimap?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'list';
        list.build();
        _$failedField = 'set';
        set.build();
        _$failedField = 'map';
        map.build();
        _$failedField = 'listMultimap';
        listMultimap.build();
        _$failedField = 'setMultimap';
        setMultimap.build();
        _$failedField = 'nullableList';
        _nullableList?.build();
        _$failedField = 'nullableSet';
        _nullableSet?.build();
        _$failedField = 'nullableMap';
        _nullableMap?.build();
        _$failedField = 'nullableListMultimap';
        _nullableListMultimap?.build();
        _$failedField = 'nullableSetMultimap';
        _nullableSetMultimap?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'Collections', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
