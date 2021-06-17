// GENERATED CODE - DO NOT MODIFY BY HAND

part of enums;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const TestEnum _$yes = const TestEnum._('yes');
const TestEnum _$no = const TestEnum._('no');
const TestEnum _$maybe = const TestEnum._('maybe');

TestEnum _$valueOf(String name) {
  switch (name) {
    case 'yes':
      return _$yes;
    case 'no':
      return _$no;
    case 'maybe':
      return _$maybe;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<TestEnum> _$values = new BuiltSet<TestEnum>(const <TestEnum>[
  _$yes,
  _$no,
  _$maybe,
]);

const SecondTestEnum _$ys = const SecondTestEnum._('yes');
const SecondTestEnum _$n = const SecondTestEnum._('no');
const SecondTestEnum _$definitely = const SecondTestEnum._('definitely');

SecondTestEnum _$vlOf(String name) {
  switch (name) {
    case 'yes':
      return _$ys;
    case 'no':
      return _$n;
    case 'definitely':
      return _$definitely;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<SecondTestEnum> _$vls =
    new BuiltSet<SecondTestEnum>(const <SecondTestEnum>[
  _$ys,
  _$n,
  _$definitely,
]);

const WireNameEnum _$wireYes = const WireNameEnum._('yes');
const WireNameEnum _$wireNo = const WireNameEnum._('no');
const WireNameEnum _$wireDefinitely = const WireNameEnum._('definitely');

WireNameEnum _$wireValueOf(String name) {
  switch (name) {
    case 'yes':
      return _$wireYes;
    case 'no':
      return _$wireNo;
    case 'definitely':
      return _$wireDefinitely;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<WireNameEnum> _$wireValues =
    new BuiltSet<WireNameEnum>(const <WireNameEnum>[
  _$wireYes,
  _$wireNo,
  _$wireDefinitely,
]);

Serializer<TestEnum> _$testEnumSerializer = new _$TestEnumSerializer();
Serializer<WireNameEnum> _$wireNameEnumSerializer =
    new _$WireNameEnumSerializer();

class _$TestEnumSerializer implements PrimitiveSerializer<TestEnum> {
  @override
  final Iterable<Type> types = const <Type>[TestEnum];
  @override
  final String wireName = 'TestEnum';

  @override
  Object serialize(Serializers serializers, TestEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  TestEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      TestEnum.valueOf(serialized as String);
}

class _$WireNameEnumSerializer implements PrimitiveSerializer<WireNameEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'yes': 'y',
    'no': 'n',
    'definitely': 'd',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'y': 'yes',
    'n': 'no',
    'd': 'definitely',
  };

  @override
  final Iterable<Type> types = const <Type>[WireNameEnum];
  @override
  final String wireName = 'E';

  @override
  Object serialize(Serializers serializers, WireNameEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  WireNameEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      WireNameEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
