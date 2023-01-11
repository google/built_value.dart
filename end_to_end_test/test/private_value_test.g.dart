// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.11

part of value_test;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PrivateValue extends _PrivateValue {
  @override
  final int value;

  factory _$PrivateValue([void Function(_PrivateValueBuilder) updates]) =>
      (new _PrivateValueBuilder()..update(updates))._build();

  _$PrivateValue._({this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'_PrivateValue', 'value');
  }

  @override
  _PrivateValue rebuild(void Function(_PrivateValueBuilder) updates) =>
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
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'_PrivateValue')..add('value', value))
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
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(_PrivateValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PrivateValue;
  }

  @override
  void update(void Function(_PrivateValueBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _PrivateValue build() => _build();

  _$PrivateValue _build() {
    final _$result = _$v ??
        new _$PrivateValue._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'_PrivateValue', 'value'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
