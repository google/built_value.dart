// GENERATED CODE - DO NOT MODIFY BY HAND

part of simple_value;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SimpleValue extends SimpleValue {
  @override
  final int anInt;
  @override
  final String aString;

  factory _$SimpleValue([void Function(SimpleValueBuilder) updates]) =>
      (new SimpleValueBuilder()..update(updates)).build();

  _$SimpleValue._({this.anInt, this.aString}) : super._() {
    BuiltValueNullFieldError.checkNotNull(anInt, 'SimpleValue', 'anInt');
    BuiltValueNullFieldError.checkNotNull(aString, 'SimpleValue', 'aString');
  }

  @override
  SimpleValue rebuild(void Function(SimpleValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SimpleValueBuilder toBuilder() => new SimpleValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SimpleValue &&
        anInt == other.anInt &&
        aString == other.aString;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, anInt.hashCode), aString.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SimpleValue')
          ..add('anInt', anInt)
          ..add('aString', aString))
        .toString();
  }
}

class SimpleValueBuilder implements Builder<SimpleValue, SimpleValueBuilder> {
  _$SimpleValue _$v;

  int _anInt;
  int get anInt => _$this._anInt;
  set anInt(int anInt) => _$this._anInt = anInt;

  String _aString;
  String get aString => _$this._aString;
  set aString(String aString) => _$this._aString = aString;

  SimpleValueBuilder();

  SimpleValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _anInt = $v.anInt;
      _aString = $v.aString;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SimpleValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SimpleValue;
  }

  @override
  void update(void Function(SimpleValueBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SimpleValue build() {
    final _$result = _$v ??
        new _$SimpleValue._(
            anInt: BuiltValueNullFieldError.checkNotNull(
                anInt, 'SimpleValue', 'anInt'),
            aString: BuiltValueNullFieldError.checkNotNull(
                aString, 'SimpleValue', 'aString'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
