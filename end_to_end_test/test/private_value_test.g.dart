// GENERATED CODE - DO NOT MODIFY BY HAND

part of value_test;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
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

class _$PrivateValue extends _PrivateValue {
  @override
  final int value;

  factory _$PrivateValue([void updates(_PrivateValueBuilder b)]) =>
      (new _PrivateValueBuilder()..update(updates)).build();

  _$PrivateValue._({this.value}) : super._() {
    if (value == null) {
      throw new BuiltValueNullFieldError('_PrivateValue', 'value');
    }
  }

  @override
  _PrivateValue rebuild(void updates(_PrivateValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  _PrivateValueBuilder toBuilder() => new _PrivateValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is _PrivateValue && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('_PrivateValue')..add('value', value))
        .toString();
  }
}

class _PrivateValueBuilder
    implements Builder<_PrivateValue, _PrivateValueBuilder> {
  _$PrivateValue _$v;

  int _value;
  int get value => _$this._value;
  set value(int value) => _$this._value = value;

  _PrivateValueBuilder();

  _PrivateValueBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(_PrivateValue other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PrivateValue;
  }

  @override
  void update(void updates(_PrivateValueBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$PrivateValue build() {
    final _$result = _$v ?? new _$PrivateValue._(value: value);
    replace(_$result);
    return _$result;
  }
}
