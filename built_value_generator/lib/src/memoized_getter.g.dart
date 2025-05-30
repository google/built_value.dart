// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memoized_getter.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MemoizedGetter extends MemoizedGetter {
  @override
  final String returnType;
  @override
  final NullabilitySuffix nullabilitySuffix;
  @override
  final String name;

  factory _$MemoizedGetter([void Function(MemoizedGetterBuilder)? updates]) =>
      (MemoizedGetterBuilder()..update(updates))._build();

  _$MemoizedGetter._(
      {required this.returnType,
      required this.nullabilitySuffix,
      required this.name})
      : super._();
  @override
  MemoizedGetter rebuild(void Function(MemoizedGetterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MemoizedGetterBuilder toBuilder() => MemoizedGetterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MemoizedGetter &&
        returnType == other.returnType &&
        nullabilitySuffix == other.nullabilitySuffix &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, returnType.hashCode);
    _$hash = $jc(_$hash, nullabilitySuffix.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MemoizedGetter')
          ..add('returnType', returnType)
          ..add('nullabilitySuffix', nullabilitySuffix)
          ..add('name', name))
        .toString();
  }
}

class MemoizedGetterBuilder
    implements Builder<MemoizedGetter, MemoizedGetterBuilder> {
  _$MemoizedGetter? _$v;

  String? _returnType;
  String? get returnType => _$this._returnType;
  set returnType(String? returnType) => _$this._returnType = returnType;

  NullabilitySuffix? _nullabilitySuffix;
  NullabilitySuffix? get nullabilitySuffix => _$this._nullabilitySuffix;
  set nullabilitySuffix(NullabilitySuffix? nullabilitySuffix) =>
      _$this._nullabilitySuffix = nullabilitySuffix;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  MemoizedGetterBuilder();

  MemoizedGetterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _returnType = $v.returnType;
      _nullabilitySuffix = $v.nullabilitySuffix;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MemoizedGetter other) {
    _$v = other as _$MemoizedGetter;
  }

  @override
  void update(void Function(MemoizedGetterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MemoizedGetter build() => _build();

  _$MemoizedGetter _build() {
    final _$result = _$v ??
        _$MemoizedGetter._(
          returnType: BuiltValueNullFieldError.checkNotNull(
              returnType, r'MemoizedGetter', 'returnType'),
          nullabilitySuffix: BuiltValueNullFieldError.checkNotNull(
              nullabilitySuffix, r'MemoizedGetter', 'nullabilitySuffix'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'MemoizedGetter', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
