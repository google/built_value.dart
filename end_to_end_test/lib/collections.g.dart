// GENERATED CODE - DO NOT MODIFY BY HAND

part of collections;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Collections> _$collectionsSerializer = new _$CollectionsSerializer();
Serializer<CollectionsWithNulls> _$collectionsWithNullsSerializer =
    new _$CollectionsWithNullsSerializer();

class _$CollectionsSerializer implements StructuredSerializer<Collections> {
  @override
  final Iterable<Type> types = const [Collections, _$Collections];
  @override
  final String wireName = 'Collections';

  @override
  Iterable serialize(Serializers serializers, Collections object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
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
    if (object.nullableList != null) {
      result
        ..add('nullableList')
        ..add(serializers.serialize(object.nullableList,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    if (object.nullableSet != null) {
      result
        ..add('nullableSet')
        ..add(serializers.serialize(object.nullableSet,
            specifiedType:
                const FullType(BuiltSet, const [const FullType(String)])));
    }
    if (object.nullableMap != null) {
      result
        ..add('nullableMap')
        ..add(serializers.serialize(object.nullableMap,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(int)])));
    }
    if (object.nullableListMultimap != null) {
      result
        ..add('nullableListMultimap')
        ..add(serializers.serialize(object.nullableListMultimap,
            specifiedType: const FullType(BuiltListMultimap,
                const [const FullType(int), const FullType(bool)])));
    }
    if (object.nullableSetMultimap != null) {
      result
        ..add('nullableSetMultimap')
        ..add(serializers.serialize(object.nullableSetMultimap,
            specifiedType: const FullType(BuiltSetMultimap,
                const [const FullType(String), const FullType(bool)])));
    }
    return result;
  }

  @override
  Collections deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CollectionsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'list':
          result.list.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList);
          break;
        case 'set':
          result.set.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(String)]))
              as BuiltSet);
          break;
        case 'map':
          result.map.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(int)
              ])) as BuiltMap);
          break;
        case 'listMultimap':
          result.listMultimap.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltListMultimap, const [
                const FullType(int),
                const FullType(bool)
              ])) as BuiltListMultimap);
          break;
        case 'setMultimap':
          result.setMultimap.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltSetMultimap, const [
                const FullType(String),
                const FullType(bool)
              ])) as BuiltSetMultimap);
          break;
        case 'nullableList':
          result.nullableList.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList);
          break;
        case 'nullableSet':
          result.nullableSet.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(String)]))
              as BuiltSet);
          break;
        case 'nullableMap':
          result.nullableMap.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(int)
              ])) as BuiltMap);
          break;
        case 'nullableListMultimap':
          result.nullableListMultimap.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltListMultimap, const [
                const FullType(int),
                const FullType(bool)
              ])) as BuiltListMultimap);
          break;
        case 'nullableSetMultimap':
          result.nullableSetMultimap.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltSetMultimap, const [
                const FullType(String),
                const FullType(bool)
              ])) as BuiltSetMultimap);
          break;
      }
    }

    return result.build();
  }
}

class _$CollectionsWithNullsSerializer
    implements StructuredSerializer<CollectionsWithNulls> {
  @override
  final Iterable<Type> types = const [
    CollectionsWithNulls,
    _$CollectionsWithNulls
  ];
  @override
  final String wireName = 'CollectionsWithNulls';

  @override
  Iterable serialize(Serializers serializers, CollectionsWithNulls object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
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
    result.add('nullableList');
    if (object.nullableList == null) {
      result.add(null);
    } else {
      result.add(serializers.serialize(object.nullableList,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])));
    }
    result.add('nullableSet');
    if (object.nullableSet == null) {
      result.add(null);
    } else {
      result.add(serializers.serialize(object.nullableSet,
          specifiedType:
              const FullType(BuiltSet, const [const FullType(String)])));
    }
    result.add('nullableMap');
    if (object.nullableMap == null) {
      result.add(null);
    } else {
      result.add(serializers.serialize(object.nullableMap,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(String), const FullType(int)])));
    }
    result.add('nullableListMultimap');
    if (object.nullableListMultimap == null) {
      result.add(null);
    } else {
      result.add(serializers.serialize(object.nullableListMultimap,
          specifiedType: const FullType(BuiltListMultimap,
              const [const FullType(int), const FullType(bool)])));
    }
    result.add('nullableSetMultimap');
    if (object.nullableSetMultimap == null) {
      result.add(null);
    } else {
      result.add(serializers.serialize(object.nullableSetMultimap,
          specifiedType: const FullType(BuiltSetMultimap,
              const [const FullType(String), const FullType(bool)])));
    }
    return result;
  }

  @override
  CollectionsWithNulls deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CollectionsWithNullsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      if (value == null) continue;
      switch (key) {
        case 'list':
          result.list.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList);
          break;
        case 'set':
          result.set.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(String)]))
              as BuiltSet);
          break;
        case 'map':
          result.map.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(int)
              ])) as BuiltMap);
          break;
        case 'listMultimap':
          result.listMultimap.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltListMultimap, const [
                const FullType(int),
                const FullType(bool)
              ])) as BuiltListMultimap);
          break;
        case 'setMultimap':
          result.setMultimap.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltSetMultimap, const [
                const FullType(String),
                const FullType(bool)
              ])) as BuiltSetMultimap);
          break;
        case 'nullableList':
          result.nullableList.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList);
          break;
        case 'nullableSet':
          result.nullableSet.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(String)]))
              as BuiltSet);
          break;
        case 'nullableMap':
          result.nullableMap.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(int)
              ])) as BuiltMap);
          break;
        case 'nullableListMultimap':
          result.nullableListMultimap.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltListMultimap, const [
                const FullType(int),
                const FullType(bool)
              ])) as BuiltListMultimap);
          break;
        case 'nullableSetMultimap':
          result.nullableSetMultimap.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltSetMultimap, const [
                const FullType(String),
                const FullType(bool)
              ])) as BuiltSetMultimap);
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
  final BuiltList<int> nullableList;
  @override
  final BuiltSet<String> nullableSet;
  @override
  final BuiltMap<String, int> nullableMap;
  @override
  final BuiltListMultimap<int, bool> nullableListMultimap;
  @override
  final BuiltSetMultimap<String, bool> nullableSetMultimap;

  factory _$Collections([void Function(CollectionsBuilder) updates]) =>
      (new CollectionsBuilder()..update(updates)).build();

  _$Collections._(
      {this.list,
      this.set,
      this.map,
      this.listMultimap,
      this.setMultimap,
      this.nullableList,
      this.nullableSet,
      this.nullableMap,
      this.nullableListMultimap,
      this.nullableSetMultimap})
      : super._() {
    if (list == null) {
      throw new BuiltValueNullFieldError('Collections', 'list');
    }
    if (set == null) {
      throw new BuiltValueNullFieldError('Collections', 'set');
    }
    if (map == null) {
      throw new BuiltValueNullFieldError('Collections', 'map');
    }
    if (listMultimap == null) {
      throw new BuiltValueNullFieldError('Collections', 'listMultimap');
    }
    if (setMultimap == null) {
      throw new BuiltValueNullFieldError('Collections', 'setMultimap');
    }
  }

  @override
  Collections rebuild(void Function(CollectionsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollectionsBuilder toBuilder() => new CollectionsBuilder()..replace(this);

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
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc($jc(0, list.hashCode), set.hashCode),
                                    map.hashCode),
                                listMultimap.hashCode),
                            setMultimap.hashCode),
                        nullableList.hashCode),
                    nullableSet.hashCode),
                nullableMap.hashCode),
            nullableListMultimap.hashCode),
        nullableSetMultimap.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Collections')
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
  _$Collections _$v;

  ListBuilder<int> _list;
  ListBuilder<int> get list => _$this._list ??= new ListBuilder<int>();
  set list(ListBuilder<int> list) => _$this._list = list;

  SetBuilder<String> _set;
  SetBuilder<String> get set => _$this._set ??= new SetBuilder<String>();
  set set(SetBuilder<String> set) => _$this._set = set;

  MapBuilder<String, int> _map;
  MapBuilder<String, int> get map =>
      _$this._map ??= new MapBuilder<String, int>();
  set map(MapBuilder<String, int> map) => _$this._map = map;

  ListMultimapBuilder<int, bool> _listMultimap;
  ListMultimapBuilder<int, bool> get listMultimap =>
      _$this._listMultimap ??= new ListMultimapBuilder<int, bool>();
  set listMultimap(ListMultimapBuilder<int, bool> listMultimap) =>
      _$this._listMultimap = listMultimap;

  SetMultimapBuilder<String, bool> _setMultimap;
  SetMultimapBuilder<String, bool> get setMultimap =>
      _$this._setMultimap ??= new SetMultimapBuilder<String, bool>();
  set setMultimap(SetMultimapBuilder<String, bool> setMultimap) =>
      _$this._setMultimap = setMultimap;

  ListBuilder<int> _nullableList;
  ListBuilder<int> get nullableList =>
      _$this._nullableList ??= new ListBuilder<int>();
  set nullableList(ListBuilder<int> nullableList) =>
      _$this._nullableList = nullableList;

  SetBuilder<String> _nullableSet;
  SetBuilder<String> get nullableSet =>
      _$this._nullableSet ??= new SetBuilder<String>();
  set nullableSet(SetBuilder<String> nullableSet) =>
      _$this._nullableSet = nullableSet;

  MapBuilder<String, int> _nullableMap;
  MapBuilder<String, int> get nullableMap =>
      _$this._nullableMap ??= new MapBuilder<String, int>();
  set nullableMap(MapBuilder<String, int> nullableMap) =>
      _$this._nullableMap = nullableMap;

  ListMultimapBuilder<int, bool> _nullableListMultimap;
  ListMultimapBuilder<int, bool> get nullableListMultimap =>
      _$this._nullableListMultimap ??= new ListMultimapBuilder<int, bool>();
  set nullableListMultimap(
          ListMultimapBuilder<int, bool> nullableListMultimap) =>
      _$this._nullableListMultimap = nullableListMultimap;

  SetMultimapBuilder<String, bool> _nullableSetMultimap;
  SetMultimapBuilder<String, bool> get nullableSetMultimap =>
      _$this._nullableSetMultimap ??= new SetMultimapBuilder<String, bool>();
  set nullableSetMultimap(
          SetMultimapBuilder<String, bool> nullableSetMultimap) =>
      _$this._nullableSetMultimap = nullableSetMultimap;

  CollectionsBuilder();

  CollectionsBuilder get _$this {
    if (_$v != null) {
      _list = _$v.list?.toBuilder();
      _set = _$v.set?.toBuilder();
      _map = _$v.map?.toBuilder();
      _listMultimap = _$v.listMultimap?.toBuilder();
      _setMultimap = _$v.setMultimap?.toBuilder();
      _nullableList = _$v.nullableList?.toBuilder();
      _nullableSet = _$v.nullableSet?.toBuilder();
      _nullableMap = _$v.nullableMap?.toBuilder();
      _nullableListMultimap = _$v.nullableListMultimap?.toBuilder();
      _nullableSetMultimap = _$v.nullableSetMultimap?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Collections other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Collections;
  }

  @override
  void update(void Function(CollectionsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Collections build() {
    _$Collections _$result;
    try {
      _$result = _$v ??
          new _$Collections._(
              list: list.build(),
              set: set.build(),
              map: map.build(),
              listMultimap: listMultimap.build(),
              setMultimap: setMultimap.build(),
              nullableList: _nullableList?.build(),
              nullableSet: _nullableSet?.build(),
              nullableMap: _nullableMap?.build(),
              nullableListMultimap: _nullableListMultimap?.build(),
              nullableSetMultimap: _nullableSetMultimap?.build());
    } catch (_) {
      String _$failedField;
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
        throw new BuiltValueNestedFieldError(
            'Collections', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CollectionsWithNulls extends CollectionsWithNulls {
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
  final BuiltList<int> nullableList;
  @override
  final BuiltSet<String> nullableSet;
  @override
  final BuiltMap<String, int> nullableMap;
  @override
  final BuiltListMultimap<int, bool> nullableListMultimap;
  @override
  final BuiltSetMultimap<String, bool> nullableSetMultimap;

  factory _$CollectionsWithNulls(
          [void Function(CollectionsWithNullsBuilder) updates]) =>
      (new CollectionsWithNullsBuilder()..update(updates)).build();

  _$CollectionsWithNulls._(
      {this.list,
      this.set,
      this.map,
      this.listMultimap,
      this.setMultimap,
      this.nullableList,
      this.nullableSet,
      this.nullableMap,
      this.nullableListMultimap,
      this.nullableSetMultimap})
      : super._() {
    if (list == null) {
      throw new BuiltValueNullFieldError('CollectionsWithNulls', 'list');
    }
    if (set == null) {
      throw new BuiltValueNullFieldError('CollectionsWithNulls', 'set');
    }
    if (map == null) {
      throw new BuiltValueNullFieldError('CollectionsWithNulls', 'map');
    }
    if (listMultimap == null) {
      throw new BuiltValueNullFieldError(
          'CollectionsWithNulls', 'listMultimap');
    }
    if (setMultimap == null) {
      throw new BuiltValueNullFieldError('CollectionsWithNulls', 'setMultimap');
    }
  }

  @override
  CollectionsWithNulls rebuild(
          void Function(CollectionsWithNullsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CollectionsWithNullsBuilder toBuilder() =>
      new CollectionsWithNullsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CollectionsWithNulls &&
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
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc($jc(0, list.hashCode), set.hashCode),
                                    map.hashCode),
                                listMultimap.hashCode),
                            setMultimap.hashCode),
                        nullableList.hashCode),
                    nullableSet.hashCode),
                nullableMap.hashCode),
            nullableListMultimap.hashCode),
        nullableSetMultimap.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CollectionsWithNulls')
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

class CollectionsWithNullsBuilder
    implements Builder<CollectionsWithNulls, CollectionsWithNullsBuilder> {
  _$CollectionsWithNulls _$v;

  ListBuilder<int> _list;
  ListBuilder<int> get list => _$this._list ??= new ListBuilder<int>();
  set list(ListBuilder<int> list) => _$this._list = list;

  SetBuilder<String> _set;
  SetBuilder<String> get set => _$this._set ??= new SetBuilder<String>();
  set set(SetBuilder<String> set) => _$this._set = set;

  MapBuilder<String, int> _map;
  MapBuilder<String, int> get map =>
      _$this._map ??= new MapBuilder<String, int>();
  set map(MapBuilder<String, int> map) => _$this._map = map;

  ListMultimapBuilder<int, bool> _listMultimap;
  ListMultimapBuilder<int, bool> get listMultimap =>
      _$this._listMultimap ??= new ListMultimapBuilder<int, bool>();
  set listMultimap(ListMultimapBuilder<int, bool> listMultimap) =>
      _$this._listMultimap = listMultimap;

  SetMultimapBuilder<String, bool> _setMultimap;
  SetMultimapBuilder<String, bool> get setMultimap =>
      _$this._setMultimap ??= new SetMultimapBuilder<String, bool>();
  set setMultimap(SetMultimapBuilder<String, bool> setMultimap) =>
      _$this._setMultimap = setMultimap;

  ListBuilder<int> _nullableList;
  ListBuilder<int> get nullableList =>
      _$this._nullableList ??= new ListBuilder<int>();
  set nullableList(ListBuilder<int> nullableList) =>
      _$this._nullableList = nullableList;

  SetBuilder<String> _nullableSet;
  SetBuilder<String> get nullableSet =>
      _$this._nullableSet ??= new SetBuilder<String>();
  set nullableSet(SetBuilder<String> nullableSet) =>
      _$this._nullableSet = nullableSet;

  MapBuilder<String, int> _nullableMap;
  MapBuilder<String, int> get nullableMap =>
      _$this._nullableMap ??= new MapBuilder<String, int>();
  set nullableMap(MapBuilder<String, int> nullableMap) =>
      _$this._nullableMap = nullableMap;

  ListMultimapBuilder<int, bool> _nullableListMultimap;
  ListMultimapBuilder<int, bool> get nullableListMultimap =>
      _$this._nullableListMultimap ??= new ListMultimapBuilder<int, bool>();
  set nullableListMultimap(
          ListMultimapBuilder<int, bool> nullableListMultimap) =>
      _$this._nullableListMultimap = nullableListMultimap;

  SetMultimapBuilder<String, bool> _nullableSetMultimap;
  SetMultimapBuilder<String, bool> get nullableSetMultimap =>
      _$this._nullableSetMultimap ??= new SetMultimapBuilder<String, bool>();
  set nullableSetMultimap(
          SetMultimapBuilder<String, bool> nullableSetMultimap) =>
      _$this._nullableSetMultimap = nullableSetMultimap;

  CollectionsWithNullsBuilder();

  CollectionsWithNullsBuilder get _$this {
    if (_$v != null) {
      _list = _$v.list?.toBuilder();
      _set = _$v.set?.toBuilder();
      _map = _$v.map?.toBuilder();
      _listMultimap = _$v.listMultimap?.toBuilder();
      _setMultimap = _$v.setMultimap?.toBuilder();
      _nullableList = _$v.nullableList?.toBuilder();
      _nullableSet = _$v.nullableSet?.toBuilder();
      _nullableMap = _$v.nullableMap?.toBuilder();
      _nullableListMultimap = _$v.nullableListMultimap?.toBuilder();
      _nullableSetMultimap = _$v.nullableSetMultimap?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CollectionsWithNulls other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CollectionsWithNulls;
  }

  @override
  void update(void Function(CollectionsWithNullsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CollectionsWithNulls build() {
    _$CollectionsWithNulls _$result;
    try {
      _$result = _$v ??
          new _$CollectionsWithNulls._(
              list: list.build(),
              set: set.build(),
              map: map.build(),
              listMultimap: listMultimap.build(),
              setMultimap: setMultimap.build(),
              nullableList: _nullableList?.build(),
              nullableSet: _nullableSet?.build(),
              nullableMap: _nullableMap?.build(),
              nullableListMultimap: _nullableListMultimap?.build(),
              nullableSetMultimap: _nullableSetMultimap?.build());
    } catch (_) {
      String _$failedField;
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
        throw new BuiltValueNestedFieldError(
            'CollectionsWithNulls', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
