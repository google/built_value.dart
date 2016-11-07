// GENERATED CODE - DO NOT MODIFY BY HAND

part of collections;

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
  ListBuilder<int> nullableList;
  SetBuilder<String> nullableSet;
  MapBuilder<String, int> nullableMap;
  ListMultimapBuilder<int, bool> nullableListMultimap;
  SetMultimapBuilder<String, bool> nullableSetMultimap;

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
        nullableList: nullableList?.build(),
        nullableSet: nullableSet?.build(),
        nullableMap: nullableMap?.build(),
        nullableListMultimap: nullableListMultimap?.build(),
        nullableSetMultimap: nullableSetMultimap?.build());
  }
}
