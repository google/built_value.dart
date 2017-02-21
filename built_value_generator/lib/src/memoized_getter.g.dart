// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.memoized_getter;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class MemoizedGetter
// **************************************************************************

class _$MemoizedGetter extends MemoizedGetter {
  @override
  final String returnType;
  @override
  final String name;

  factory _$MemoizedGetter([void updates(MemoizedGetterBuilder b)]) =>
      (new MemoizedGetterBuilder()..update(updates)).build();

  _$MemoizedGetter._({this.returnType, this.name}) : super._() {
    if (returnType == null) throw new ArgumentError.notNull('returnType');
    if (name == null) throw new ArgumentError.notNull('name');
  }

  @override
  MemoizedGetter rebuild(void updates(MemoizedGetterBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MemoizedGetterBuilder toBuilder() =>
      new MemoizedGetterBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! MemoizedGetter) return false;
    return returnType == other.returnType && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, returnType.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return 'MemoizedGetter {'
        'returnType=${returnType.toString()},\n'
        'name=${name.toString()},\n'
        '}';
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
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$MemoizedGetter;
  }

  @override
  void update(void updates(MemoizedGetterBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$MemoizedGetter build() {
    final result =
        _$v ?? new _$MemoizedGetter._(returnType: returnType, name: name);
    replace(result);
    return result;
  }
}
