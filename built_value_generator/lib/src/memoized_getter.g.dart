// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.memoized_getter;

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
      (new MemoizedGetterBuilder()..update(updates))._build();

  _$MemoizedGetter._(
      {required this.returnType,
      required this.nullabilitySuffix,
      required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        returnType, r'MemoizedGetter', 'returnType');
    BuiltValueNullFieldError.checkNotNull(
        nullabilitySuffix, r'MemoizedGetter', 'nullabilitySuffix');
    BuiltValueNullFieldError.checkNotNull(name, r'MemoizedGetter', 'name');
  }

  @override
  MemoizedGetter rebuild(void Function(MemoizedGetterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MemoizedGetterBuilder toBuilder() =>
      new MemoizedGetterBuilder()..replace(this);

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
    return $jf($jc($jc($jc(0, returnType.hashCode), nullabilitySuffix.hashCode),
        name.hashCode));
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
    ArgumentError.checkNotNull(other, 'other');
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
        new _$MemoizedGetter._(
            returnType: BuiltValueNullFieldError.checkNotNull(
                returnType, r'MemoizedGetter', 'returnType'),
            nullabilitySuffix: BuiltValueNullFieldError.checkNotNull(
                nullabilitySuffix, r'MemoizedGetter', 'nullabilitySuffix'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'MemoizedGetter', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
