// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'collections_nnbd.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Collections> _$collectionsSerializer = new _$CollectionsSerializer();

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
      'nullsInList',
      serializers.serialize(object.nullsInList,
          specifiedType:
              const FullType(BuiltList, const [const FullType.nullable(int)])),
      'nullsInSet',
      serializers.serialize(object.nullsInSet,
          specifiedType: const FullType(
              BuiltSet, const [const FullType.nullable(String)])),
      'nullsInMap',
      serializers.serialize(object.nullsInMap,
          specifiedType: const FullType(BuiltMap, const [
            const FullType.nullable(String),
            const FullType.nullable(int)
          ])),
      'nullsInListMultimap',
      serializers.serialize(object.nullsInListMultimap,
          specifiedType: const FullType(BuiltListMultimap,
              const [const FullType.nullable(int), const FullType(bool)])),
      'nullsInSetMultimap',
      serializers.serialize(object.nullsInSetMultimap,
          specifiedType: const FullType(BuiltSetMultimap,
              const [const FullType(String), const FullType.nullable(bool)])),
      'nullableInGenericsList',
      serializers.serialize(object.nullableInGenericsList,
          specifiedType: const FullType(BuiltList, const [
            const FullType(Foo, const [const FullType.nullable(int)])
          ])),
      'nestedNullablesList',
      serializers.serialize(object.nestedNullablesList,
          specifiedType: const FullType(BuiltList, const [
            const FullType.nullable(
                BuiltList, const [const FullType.nullable(int)])
          ])),
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
    final result = new CollectionsBuilder();

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
        case 'nullsInList':
          result.nullsInList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType.nullable(int)]))!
              as BuiltList<Object?>);
          break;
        case 'nullsInSet':
          result.nullsInSet.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltSet, const [const FullType.nullable(String)]))!
              as BuiltSet<Object?>);
          break;
        case 'nullsInMap':
          result.nullsInMap.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType.nullable(String),
                const FullType.nullable(int)
              ]))!);
          break;
        case 'nullsInListMultimap':
          result.nullsInListMultimap.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltListMultimap, const [
                const FullType.nullable(int),
                const FullType(bool)
              ]))!);
          break;
        case 'nullsInSetMultimap':
          result.nullsInSetMultimap.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltSetMultimap, const [
                const FullType(String),
                const FullType.nullable(bool)
              ]))!);
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
        case 'nullableInGenericsList':
          result.nullableInGenericsList.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(Foo, const [const FullType.nullable(int)])
              ]))! as BuiltList<Object?>);
          break;
        case 'nestedNullablesList':
          result.nestedNullablesList.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(
                    BuiltList, const [const FullType.nullable(int)])
              ]))! as BuiltList<Object?>);
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
  final BuiltList<int?> nullsInList;
  @override
  final BuiltSet<String?> nullsInSet;
  @override
  final BuiltMap<String?, int?> nullsInMap;
  @override
  final BuiltListMultimap<int?, bool> nullsInListMultimap;
  @override
  final BuiltSetMultimap<String, bool?> nullsInSetMultimap;
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
  @override
  final BuiltList<Foo<int?>> nullableInGenericsList;
  @override
  final BuiltList<BuiltList<int?>?> nestedNullablesList;

  factory _$Collections([void Function(CollectionsBuilder)? updates]) =>
      (new CollectionsBuilder()..update(updates))._build();

  _$Collections._(
      {required this.list,
      required this.set,
      required this.map,
      required this.listMultimap,
      required this.setMultimap,
      required this.nullsInList,
      required this.nullsInSet,
      required this.nullsInMap,
      required this.nullsInListMultimap,
      required this.nullsInSetMultimap,
      this.nullableList,
      this.nullableSet,
      this.nullableMap,
      this.nullableListMultimap,
      this.nullableSetMultimap,
      required this.nullableInGenericsList,
      required this.nestedNullablesList})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(list, 'Collections', 'list');
    BuiltValueNullFieldError.checkNotNull(set, 'Collections', 'set');
    BuiltValueNullFieldError.checkNotNull(map, 'Collections', 'map');
    BuiltValueNullFieldError.checkNotNull(
        listMultimap, 'Collections', 'listMultimap');
    BuiltValueNullFieldError.checkNotNull(
        setMultimap, 'Collections', 'setMultimap');
    BuiltValueNullFieldError.checkNotNull(
        nullsInList, 'Collections', 'nullsInList');
    BuiltValueNullFieldError.checkNotNull(
        nullsInSet, 'Collections', 'nullsInSet');
    BuiltValueNullFieldError.checkNotNull(
        nullsInMap, 'Collections', 'nullsInMap');
    BuiltValueNullFieldError.checkNotNull(
        nullsInListMultimap, 'Collections', 'nullsInListMultimap');
    BuiltValueNullFieldError.checkNotNull(
        nullsInSetMultimap, 'Collections', 'nullsInSetMultimap');
    BuiltValueNullFieldError.checkNotNull(
        nullableInGenericsList, 'Collections', 'nullableInGenericsList');
    BuiltValueNullFieldError.checkNotNull(
        nestedNullablesList, 'Collections', 'nestedNullablesList');
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
        nullsInList == other.nullsInList &&
        nullsInSet == other.nullsInSet &&
        nullsInMap == other.nullsInMap &&
        nullsInListMultimap == other.nullsInListMultimap &&
        nullsInSetMultimap == other.nullsInSetMultimap &&
        nullableList == other.nullableList &&
        nullableSet == other.nullableSet &&
        nullableMap == other.nullableMap &&
        nullableListMultimap == other.nullableListMultimap &&
        nullableSetMultimap == other.nullableSetMultimap &&
        nullableInGenericsList == other.nullableInGenericsList &&
        nestedNullablesList == other.nestedNullablesList;
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
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        0,
                                                                        list
                                                                            .hashCode),
                                                                    set
                                                                        .hashCode),
                                                                map.hashCode),
                                                            listMultimap
                                                                .hashCode),
                                                        setMultimap.hashCode),
                                                    nullsInList.hashCode),
                                                nullsInSet.hashCode),
                                            nullsInMap.hashCode),
                                        nullsInListMultimap.hashCode),
                                    nullsInSetMultimap.hashCode),
                                nullableList.hashCode),
                            nullableSet.hashCode),
                        nullableMap.hashCode),
                    nullableListMultimap.hashCode),
                nullableSetMultimap.hashCode),
            nullableInGenericsList.hashCode),
        nestedNullablesList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Collections')
          ..add('list', list)
          ..add('set', set)
          ..add('map', map)
          ..add('listMultimap', listMultimap)
          ..add('setMultimap', setMultimap)
          ..add('nullsInList', nullsInList)
          ..add('nullsInSet', nullsInSet)
          ..add('nullsInMap', nullsInMap)
          ..add('nullsInListMultimap', nullsInListMultimap)
          ..add('nullsInSetMultimap', nullsInSetMultimap)
          ..add('nullableList', nullableList)
          ..add('nullableSet', nullableSet)
          ..add('nullableMap', nullableMap)
          ..add('nullableListMultimap', nullableListMultimap)
          ..add('nullableSetMultimap', nullableSetMultimap)
          ..add('nullableInGenericsList', nullableInGenericsList)
          ..add('nestedNullablesList', nestedNullablesList))
        .toString();
  }
}

class CollectionsBuilder implements Builder<Collections, CollectionsBuilder> {
  _$Collections? _$v;

  ListBuilder<int>? _list;
  ListBuilder<int> get list => _$this._list ??= new ListBuilder<int>();
  set list(ListBuilder<int>? list) => _$this._list = list;

  SetBuilder<String>? _set;
  SetBuilder<String> get set => _$this._set ??= new SetBuilder<String>();
  set set(SetBuilder<String>? set) => _$this._set = set;

  MapBuilder<String, int>? _map;
  MapBuilder<String, int> get map =>
      _$this._map ??= new MapBuilder<String, int>();
  set map(MapBuilder<String, int>? map) => _$this._map = map;

  ListMultimapBuilder<int, bool>? _listMultimap;
  ListMultimapBuilder<int, bool> get listMultimap =>
      _$this._listMultimap ??= new ListMultimapBuilder<int, bool>();
  set listMultimap(ListMultimapBuilder<int, bool>? listMultimap) =>
      _$this._listMultimap = listMultimap;

  SetMultimapBuilder<String, bool>? _setMultimap;
  SetMultimapBuilder<String, bool> get setMultimap =>
      _$this._setMultimap ??= new SetMultimapBuilder<String, bool>();
  set setMultimap(SetMultimapBuilder<String, bool>? setMultimap) =>
      _$this._setMultimap = setMultimap;

  ListBuilder<int?>? _nullsInList;
  ListBuilder<int?> get nullsInList =>
      _$this._nullsInList ??= new ListBuilder<int?>();
  set nullsInList(ListBuilder<int?>? nullsInList) =>
      _$this._nullsInList = nullsInList;

  SetBuilder<String?>? _nullsInSet;
  SetBuilder<String?> get nullsInSet =>
      _$this._nullsInSet ??= new SetBuilder<String?>();
  set nullsInSet(SetBuilder<String?>? nullsInSet) =>
      _$this._nullsInSet = nullsInSet;

  MapBuilder<String?, int?>? _nullsInMap;
  MapBuilder<String?, int?> get nullsInMap =>
      _$this._nullsInMap ??= new MapBuilder<String?, int?>();
  set nullsInMap(MapBuilder<String?, int?>? nullsInMap) =>
      _$this._nullsInMap = nullsInMap;

  ListMultimapBuilder<int?, bool>? _nullsInListMultimap;
  ListMultimapBuilder<int?, bool> get nullsInListMultimap =>
      _$this._nullsInListMultimap ??= new ListMultimapBuilder<int?, bool>();
  set nullsInListMultimap(
          ListMultimapBuilder<int?, bool>? nullsInListMultimap) =>
      _$this._nullsInListMultimap = nullsInListMultimap;

  SetMultimapBuilder<String, bool?>? _nullsInSetMultimap;
  SetMultimapBuilder<String, bool?> get nullsInSetMultimap =>
      _$this._nullsInSetMultimap ??= new SetMultimapBuilder<String, bool?>();
  set nullsInSetMultimap(
          SetMultimapBuilder<String, bool?>? nullsInSetMultimap) =>
      _$this._nullsInSetMultimap = nullsInSetMultimap;

  ListBuilder<int>? _nullableList;
  ListBuilder<int> get nullableList =>
      _$this._nullableList ??= new ListBuilder<int>();
  set nullableList(ListBuilder<int>? nullableList) =>
      _$this._nullableList = nullableList;

  SetBuilder<String>? _nullableSet;
  SetBuilder<String> get nullableSet =>
      _$this._nullableSet ??= new SetBuilder<String>();
  set nullableSet(SetBuilder<String>? nullableSet) =>
      _$this._nullableSet = nullableSet;

  MapBuilder<String, int>? _nullableMap;
  MapBuilder<String, int> get nullableMap =>
      _$this._nullableMap ??= new MapBuilder<String, int>();
  set nullableMap(MapBuilder<String, int>? nullableMap) =>
      _$this._nullableMap = nullableMap;

  ListMultimapBuilder<int, bool>? _nullableListMultimap;
  ListMultimapBuilder<int, bool> get nullableListMultimap =>
      _$this._nullableListMultimap ??= new ListMultimapBuilder<int, bool>();
  set nullableListMultimap(
          ListMultimapBuilder<int, bool>? nullableListMultimap) =>
      _$this._nullableListMultimap = nullableListMultimap;

  SetMultimapBuilder<String, bool>? _nullableSetMultimap;
  SetMultimapBuilder<String, bool> get nullableSetMultimap =>
      _$this._nullableSetMultimap ??= new SetMultimapBuilder<String, bool>();
  set nullableSetMultimap(
          SetMultimapBuilder<String, bool>? nullableSetMultimap) =>
      _$this._nullableSetMultimap = nullableSetMultimap;

  ListBuilder<Foo<int?>>? _nullableInGenericsList;
  ListBuilder<Foo<int?>> get nullableInGenericsList =>
      _$this._nullableInGenericsList ??= new ListBuilder<Foo<int?>>();
  set nullableInGenericsList(ListBuilder<Foo<int?>>? nullableInGenericsList) =>
      _$this._nullableInGenericsList = nullableInGenericsList;

  ListBuilder<BuiltList<int?>?>? _nestedNullablesList;
  ListBuilder<BuiltList<int?>?> get nestedNullablesList =>
      _$this._nestedNullablesList ??= new ListBuilder<BuiltList<int?>?>();
  set nestedNullablesList(ListBuilder<BuiltList<int?>?>? nestedNullablesList) =>
      _$this._nestedNullablesList = nestedNullablesList;

  CollectionsBuilder();

  CollectionsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _list = $v.list.toBuilder();
      _set = $v.set.toBuilder();
      _map = $v.map.toBuilder();
      _listMultimap = $v.listMultimap.toBuilder();
      _setMultimap = $v.setMultimap.toBuilder();
      _nullsInList = $v.nullsInList.toBuilder();
      _nullsInSet = $v.nullsInSet.toBuilder();
      _nullsInMap = $v.nullsInMap.toBuilder();
      _nullsInListMultimap = $v.nullsInListMultimap.toBuilder();
      _nullsInSetMultimap = $v.nullsInSetMultimap.toBuilder();
      _nullableList = $v.nullableList?.toBuilder();
      _nullableSet = $v.nullableSet?.toBuilder();
      _nullableMap = $v.nullableMap?.toBuilder();
      _nullableListMultimap = $v.nullableListMultimap?.toBuilder();
      _nullableSetMultimap = $v.nullableSetMultimap?.toBuilder();
      _nullableInGenericsList = $v.nullableInGenericsList.toBuilder();
      _nestedNullablesList = $v.nestedNullablesList.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Collections other) {
    ArgumentError.checkNotNull(other, 'other');
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
          new _$Collections._(
              list: list.build(),
              set: set.build(),
              map: map.build(),
              listMultimap: listMultimap.build(),
              setMultimap: setMultimap.build(),
              nullsInList: nullsInList.build(),
              nullsInSet: nullsInSet.build(),
              nullsInMap: nullsInMap.build(),
              nullsInListMultimap: nullsInListMultimap.build(),
              nullsInSetMultimap: nullsInSetMultimap.build(),
              nullableList: _nullableList?.build(),
              nullableSet: _nullableSet?.build(),
              nullableMap: _nullableMap?.build(),
              nullableListMultimap: _nullableListMultimap?.build(),
              nullableSetMultimap: _nullableSetMultimap?.build(),
              nullableInGenericsList: nullableInGenericsList.build(),
              nestedNullablesList: nestedNullablesList.build());
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
        _$failedField = 'nullsInList';
        nullsInList.build();
        _$failedField = 'nullsInSet';
        nullsInSet.build();
        _$failedField = 'nullsInMap';
        nullsInMap.build();
        _$failedField = 'nullsInListMultimap';
        nullsInListMultimap.build();
        _$failedField = 'nullsInSetMultimap';
        nullsInSetMultimap.build();
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
        _$failedField = 'nullableInGenericsList';
        nullableInGenericsList.build();
        _$failedField = 'nestedNullablesList';
        nestedNullablesList.build();
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
