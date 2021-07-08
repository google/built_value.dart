// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.11

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

  factory _$MemoizedGetter([void Function(MemoizedGetterBuilder) updates]) =>
      (new MemoizedGetterBuilder()..update(updates)).build();

  _$MemoizedGetter._({this.returnType, this.nullabilitySuffix, this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        returnType, 'MemoizedGetter', 'returnType');
    BuiltValueNullFieldError.checkNotNull(
        nullabilitySuffix, 'MemoizedGetter', 'nullabilitySuffix');
    BuiltValueNullFieldError.checkNotNull(name, 'MemoizedGetter', 'name');
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
    return (newBuiltValueToStringHelper('MemoizedGetter')
          ..add('returnType', returnType)
          ..add('nullabilitySuffix', nullabilitySuffix)
          ..add('name', name))
        .toString();
  }
}

class MemoizedGetterBuilder
    implements Builder<MemoizedGetter, MemoizedGetterBuilder> {
  _$MemoizedGetter _$v;

  String _returnType;
  String get returnType => _$this._returnType;
  set returnType(String returnType) => _$this._returnType = returnType;

  NullabilitySuffix _nullabilitySuffix;
  NullabilitySuffix get nullabilitySuffix => _$this._nullabilitySuffix;
  set nullabilitySuffix(NullabilitySuffix nullabilitySuffix) =>
      _$this._nullabilitySuffix = nullabilitySuffix;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

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
  void update(void Function(MemoizedGetterBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MemoizedGetter build() {
    final _$result = _$v ??
        new _$MemoizedGetter._(
            returnType: BuiltValueNullFieldError.checkNotNull(
                returnType, 'MemoizedGetter', 'returnType'),
            nullabilitySuffix: BuiltValueNullFieldError.checkNotNull(
                nullabilitySuffix, 'MemoizedGetter', 'nullabilitySuffix'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'MemoizedGetter', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
