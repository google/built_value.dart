// GENERATED CODE - DO NOT MODIFY BY HAND

part of collections;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: library collections
// **************************************************************************

Serializer<Collections> _$collectionsSerializer = new _$CollectionsSerializer();

class _$CollectionsSerializer implements StructuredSerializer<Collections> {
  final Iterable<Type> types = const [Collections, _$Collections];
  final String wireName = 'Collections';

  @override
  Iterable serialize(Serializers serializers, Collections object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = [
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
      result.add('nullableList');
      result.add(serializers.serialize(object.nullableList,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])));
    }
    if (object.nullableSet != null) {
      result.add('nullableSet');
      result.add(serializers.serialize(object.nullableSet,
          specifiedType:
              const FullType(BuiltSet, const [const FullType(String)])));
    }
    if (object.nullableMap != null) {
      result.add('nullableMap');
      result.add(serializers.serialize(object.nullableMap,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(String), const FullType(int)])));
    }
    if (object.nullableListMultimap != null) {
      result.add('nullableListMultimap');
      result.add(serializers.serialize(object.nullableListMultimap,
          specifiedType: const FullType(BuiltListMultimap,
              const [const FullType(int), const FullType(bool)])));
    }
    if (object.nullableSetMultimap != null) {
      result.add('nullableSetMultimap');
      result.add(serializers.serialize(object.nullableSetMultimap,
          specifiedType: const FullType(BuiltSetMultimap,
              const [const FullType(String), const FullType(bool)])));
    }

    return result;
  }

  @override
  Collections deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new CollectionsBuilder();

    var key;
    var value;
    var expectingKey = true;
    for (final item in serialized) {
      if (expectingKey) {
        key = item;
        expectingKey = false;
      } else {
        value = item;
        expectingKey = true;

        switch (key as String) {
          case 'list':
            result.list.replace(serializers.deserialize(value,
                specifiedType:
                    const FullType(BuiltList, const [const FullType(int)])));
            break;
          case 'set':
            result.set.replace(serializers.deserialize(value,
                specifiedType:
                    const FullType(BuiltSet, const [const FullType(String)])));
            break;
          case 'map':
            result.map.replace(serializers.deserialize(value,
                specifiedType: const FullType(BuiltMap,
                    const [const FullType(String), const FullType(int)])));
            break;
          case 'listMultimap':
            result.listMultimap.replace(serializers.deserialize(value,
                specifiedType: const FullType(BuiltListMultimap,
                    const [const FullType(int), const FullType(bool)])));
            break;
          case 'setMultimap':
            result.setMultimap.replace(serializers.deserialize(value,
                specifiedType: const FullType(BuiltSetMultimap,
                    const [const FullType(String), const FullType(bool)])));
            break;
          case 'nullableList':
            result.nullableList.replace(serializers.deserialize(value,
                specifiedType:
                    const FullType(BuiltList, const [const FullType(int)])));
            break;
          case 'nullableSet':
            result.nullableSet.replace(serializers.deserialize(value,
                specifiedType:
                    const FullType(BuiltSet, const [const FullType(String)])));
            break;
          case 'nullableMap':
            result.nullableMap.replace(serializers.deserialize(value,
                specifiedType: const FullType(BuiltMap,
                    const [const FullType(String), const FullType(int)])));
            break;
          case 'nullableListMultimap':
            result.nullableListMultimap.replace(serializers.deserialize(value,
                specifiedType: const FullType(BuiltListMultimap,
                    const [const FullType(int), const FullType(bool)])));
            break;
          case 'nullableSetMultimap':
            result.nullableSetMultimap.replace(serializers.deserialize(value,
                specifiedType: const FullType(BuiltSetMultimap,
                    const [const FullType(String), const FullType(bool)])));
            break;
        }
      }
    }

    return result.build();
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Collections
// **************************************************************************

class _$Collections extends Collections {
  final BuiltList<int> list;
  final BuiltSet<String> set;
  final BuiltMap<String, int> map;
  final BuiltListMultimap<int, bool> listMultimap;
  final BuiltSetMultimap<String, bool> setMultimap;
  final BuiltList<int> nullableList;
  final BuiltSet<String> nullableSet;
  final BuiltMap<String, int> nullableMap;
  final BuiltListMultimap<int, bool> nullableListMultimap;
  final BuiltSetMultimap<String, bool> nullableSetMultimap;

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
    if (list == null) throw new ArgumentError.notNull('list');
    if (set == null) throw new ArgumentError.notNull('set');
    if (map == null) throw new ArgumentError.notNull('map');
    if (listMultimap == null) throw new ArgumentError.notNull('listMultimap');
    if (setMultimap == null) throw new ArgumentError.notNull('setMultimap');
  }

  factory _$Collections([updates(CollectionsBuilder b)]) =>
      (new CollectionsBuilder()..update(updates)).build();

  Collections rebuild(updates(CollectionsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  CollectionsBuilder toBuilder() => new CollectionsBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! Collections) return false;
    return list == other.list &&
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

  String toString() {
    return 'Collections {'
        'list=${list.toString()},\n'
        'set=${set.toString()},\n'
        'map=${map.toString()},\n'
        'listMultimap=${listMultimap.toString()},\n'
        'setMultimap=${setMultimap.toString()},\n'
        'nullableList=${nullableList.toString()},\n'
        'nullableSet=${nullableSet.toString()},\n'
        'nullableMap=${nullableMap.toString()},\n'
        'nullableListMultimap=${nullableListMultimap.toString()},\n'
        'nullableSetMultimap=${nullableSetMultimap.toString()},\n'
        '}';
  }
}

class CollectionsBuilder implements Builder<Collections, CollectionsBuilder> {
  CollectionsBuilder();
  ListBuilder<int> list = new ListBuilder<int>();
  SetBuilder<String> set = new SetBuilder<String>();
  MapBuilder<String, int> map = new MapBuilder<String, int>();
  ListMultimapBuilder<int, bool> listMultimap =
      new ListMultimapBuilder<int, bool>();
  SetMultimapBuilder<String, bool> setMultimap =
      new SetMultimapBuilder<String, bool>();
  ListBuilder<int> _nullableList;
  set nullableList(ListBuilder<int> nullableList) =>
      _nullableList = nullableList;
  ListBuilder<int> get nullableList {
    _nullableList ??= new ListBuilder<int>();
    return _nullableList;
  }

  SetBuilder<String> _nullableSet;
  set nullableSet(SetBuilder<String> nullableSet) => _nullableSet = nullableSet;
  SetBuilder<String> get nullableSet {
    _nullableSet ??= new SetBuilder<String>();
    return _nullableSet;
  }

  MapBuilder<String, int> _nullableMap;
  set nullableMap(MapBuilder<String, int> nullableMap) =>
      _nullableMap = nullableMap;
  MapBuilder<String, int> get nullableMap {
    _nullableMap ??= new MapBuilder<String, int>();
    return _nullableMap;
  }

  ListMultimapBuilder<int, bool> _nullableListMultimap;
  set nullableListMultimap(
          ListMultimapBuilder<int, bool> nullableListMultimap) =>
      _nullableListMultimap = nullableListMultimap;
  ListMultimapBuilder<int, bool> get nullableListMultimap {
    _nullableListMultimap ??= new ListMultimapBuilder<int, bool>();
    return _nullableListMultimap;
  }

  SetMultimapBuilder<String, bool> _nullableSetMultimap;
  set nullableSetMultimap(
          SetMultimapBuilder<String, bool> nullableSetMultimap) =>
      _nullableSetMultimap = nullableSetMultimap;
  SetMultimapBuilder<String, bool> get nullableSetMultimap {
    _nullableSetMultimap ??= new SetMultimapBuilder<String, bool>();
    return _nullableSetMultimap;
  }

  void replace(Collections other) {
    this.list = other.list?.toBuilder();
    this.set = other.set?.toBuilder();
    this.map = other.map?.toBuilder();
    this.listMultimap = other.listMultimap?.toBuilder();
    this.setMultimap = other.setMultimap?.toBuilder();
    this.nullableList = other.nullableList?.toBuilder();
    this.nullableSet = other.nullableSet?.toBuilder();
    this.nullableMap = other.nullableMap?.toBuilder();
    this.nullableListMultimap = other.nullableListMultimap?.toBuilder();
    this.nullableSetMultimap = other.nullableSetMultimap?.toBuilder();
  }

  void update(updates(CollectionsBuilder b)) {
    if (updates != null) updates(this);
  }

  Collections build() {
    return new _$Collections._(
        list: list?.build(),
        set: set?.build(),
        map: map?.build(),
        listMultimap: listMultimap?.build(),
        setMultimap: setMultimap?.build(),
        nullableList: _nullableList?.build(),
        nullableSet: _nullableSet?.build(),
        nullableMap: _nullableMap?.build(),
        nullableListMultimap: _nullableListMultimap?.build(),
        nullableSetMultimap: _nullableSetMultimap?.build());
  }
}
