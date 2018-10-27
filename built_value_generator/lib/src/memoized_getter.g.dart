// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.memoized_getter;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MemoizedGetter extends MemoizedGetter {
  @override
  final String returnType;
  @override
  final String name;

  factory _$MemoizedGetter([void updates(MemoizedGetterBuilder b)]) =>
      (new MemoizedGetterBuilder()..update(updates)).build();

  _$MemoizedGetter._({this.returnType, this.name}) : super._() {
    if (returnType == null) {
      throw new BuiltValueNullFieldError('MemoizedGetter', 'returnType');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('MemoizedGetter', 'name');
    }
  }

  @override
  MemoizedGetter rebuild(void updates(MemoizedGetterBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MemoizedGetterBuilder toBuilder() =>
      new MemoizedGetterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MemoizedGetter &&
        returnType == other.returnType &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, returnType.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MemoizedGetter')
          ..add('returnType', returnType)
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

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  MemoizedGetterBuilder();

  MemoizedGetterBuilder get _$this {
    if (_$v != null) {
      _returnType = _$v.returnType;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MemoizedGetter other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MemoizedGetter;
  }

  @override
  void update(void updates(MemoizedGetterBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$MemoizedGetter build() {
    final _$result =
        _$v ?? new _$MemoizedGetter._(returnType: returnType, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_as
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals
