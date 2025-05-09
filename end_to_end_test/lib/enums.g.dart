// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enums.dart';

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
      throw ArgumentError(name);
  }
}

final BuiltSet<TestEnum> _$values = BuiltSet<TestEnum>(const <TestEnum>[
  _$yes,
  _$no,
  _$maybe,
]);

class _$TestEnumMeta {
  const _$TestEnumMeta();
  TestEnum get yes => _$yes;
  TestEnum get no => _$no;
  TestEnum get maybe => _$maybe;
  TestEnum valueOf(String name) => _$valueOf(name);
  BuiltSet<TestEnum> get values => _$values;
}

mixin _$TestEnumMixin {
  // ignore: non_constant_identifier_names
  _$TestEnumMeta get TestEnum => const _$TestEnumMeta();
}

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
      throw ArgumentError(name);
  }
}

final BuiltSet<SecondTestEnum> _$vls =
    BuiltSet<SecondTestEnum>(const <SecondTestEnum>[
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
      throw ArgumentError(name);
  }
}

final BuiltSet<WireNameEnum> _$wireValues =
    BuiltSet<WireNameEnum>(const <WireNameEnum>[
  _$wireYes,
  _$wireNo,
  _$wireDefinitely,
]);

const WireNumberEnum _$wireNumberYes = const WireNumberEnum._('yes');
const WireNumberEnum _$wireNumberNo = const WireNumberEnum._('no');
const WireNumberEnum _$wireNumberDefinitely =
    const WireNumberEnum._('definitely');

WireNumberEnum _$wireNumberValueOf(String name) {
  switch (name) {
    case 'yes':
      return _$wireNumberYes;
    case 'no':
      return _$wireNumberNo;
    case 'definitely':
      return _$wireNumberDefinitely;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<WireNumberEnum> _$wireNumberValues =
    BuiltSet<WireNumberEnum>(const <WireNumberEnum>[
  _$wireNumberYes,
  _$wireNumberNo,
  _$wireNumberDefinitely,
]);

const DollarValueEnum _$value$ = const DollarValueEnum._('value\$');
const DollarValueEnum _$value = const DollarValueEnum._('\$value');

DollarValueEnum _$dollarValueOf(String name) {
  switch (name) {
    case 'value\$':
      return _$value$;
    case '\$value':
      return _$value;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<DollarValueEnum> _$dollarValues =
    BuiltSet<DollarValueEnum>(const <DollarValueEnum>[
  _$value$,
  _$value,
]);

const FallbackEnum _$fbYes = const FallbackEnum._('yes');
const FallbackEnum _$fbNo = const FallbackEnum._('no');

FallbackEnum _$fbValueOf(String name) {
  switch (name) {
    case 'yes':
      return _$fbYes;
    case 'no':
      return _$fbNo;
    default:
      return _$fbNo;
  }
}

final BuiltSet<FallbackEnum> _$fbValues =
    BuiltSet<FallbackEnum>(const <FallbackEnum>[
  _$fbYes,
  _$fbNo,
]);

const FallbackNumberEnum _$fbNumberYes = const FallbackNumberEnum._('yes');
const FallbackNumberEnum _$fbNumberNo = const FallbackNumberEnum._('no');

FallbackNumberEnum _$fbNumberValueOf(String name) {
  switch (name) {
    case 'yes':
      return _$fbNumberYes;
    case 'no':
      return _$fbNumberNo;
    default:
      return _$fbNumberNo;
  }
}

final BuiltSet<FallbackNumberEnum> _$fbNumberValues =
    BuiltSet<FallbackNumberEnum>(const <FallbackNumberEnum>[
  _$fbNumberYes,
  _$fbNumberNo,
]);

const EnumWith$Dollar_UnderScore _$dollar_UnderScoreEnum$Value =
    const EnumWith$Dollar_UnderScore._('\$value');
const EnumWith$Dollar_UnderScore _$dollar_UnderScoreEnumValue$ =
    const EnumWith$Dollar_UnderScore._('value\$');

EnumWith$Dollar_UnderScore _$enum$Dollar_UnderScoreValueOf(String name) {
  switch (name) {
    case '\$value':
      return _$dollar_UnderScoreEnum$Value;
    case 'value\$':
      return _$dollar_UnderScoreEnumValue$;
    default:
      return _$dollar_UnderScoreEnumValue$;
  }
}

final BuiltSet<EnumWith$Dollar_UnderScore> _$enum$Dollar_UnderScoreValues =
    BuiltSet<EnumWith$Dollar_UnderScore>(const <EnumWith$Dollar_UnderScore>[
  _$dollar_UnderScoreEnum$Value,
  _$dollar_UnderScoreEnumValue$,
]);

Serializer<TestEnum> _$testEnumSerializer = _$TestEnumSerializer();
Serializer<WireNameEnum> _$wireNameEnumSerializer = _$WireNameEnumSerializer();
Serializer<WireNumberEnum> _$wireNumberEnumSerializer =
    _$WireNumberEnumSerializer();
Serializer<DollarValueEnum> _$dollarValueEnumSerializer =
    _$DollarValueEnumSerializer();
Serializer<FallbackEnum> _$fallbackEnumSerializer = _$FallbackEnumSerializer();
Serializer<FallbackNumberEnum> _$fallbackNumberEnumSerializer =
    _$FallbackNumberEnumSerializer();
Serializer<EnumWith$Dollar_UnderScore> _$enumWith$DollarUnderScoreSerializer =
    _$EnumWith$Dollar_UnderScoreSerializer();

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

class _$WireNumberEnumSerializer
    implements PrimitiveSerializer<WireNumberEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'yes': 1,
    'no': 2,
    'definitely': '3',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    1: 'yes',
    2: 'no',
    '3': 'definitely',
  };

  @override
  final Iterable<Type> types = const <Type>[WireNumberEnum];
  @override
  final String wireName = 'WireNumberEnum';

  @override
  Object serialize(Serializers serializers, WireNumberEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  WireNumberEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      WireNumberEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$DollarValueEnumSerializer
    implements PrimitiveSerializer<DollarValueEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    '\$value': 'value',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'value': '\$value',
  };

  @override
  final Iterable<Type> types = const <Type>[DollarValueEnum];
  @override
  final String wireName = 'DollarValueEnum';

  @override
  Object serialize(Serializers serializers, DollarValueEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  DollarValueEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DollarValueEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$FallbackEnumSerializer implements PrimitiveSerializer<FallbackEnum> {
  @override
  final Iterable<Type> types = const <Type>[FallbackEnum];
  @override
  final String wireName = 'FallbackEnum';

  @override
  Object serialize(Serializers serializers, FallbackEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  FallbackEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      FallbackEnum.valueOf(serialized as String);
}

class _$FallbackNumberEnumSerializer
    implements PrimitiveSerializer<FallbackNumberEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'yes': 0,
    'no': -1,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    0: 'yes',
    -1: 'no',
  };

  @override
  final Iterable<Type> types = const <Type>[FallbackNumberEnum];
  @override
  final String wireName = 'FallbackNumberEnum';

  @override
  Object serialize(Serializers serializers, FallbackNumberEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  FallbackNumberEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      FallbackNumberEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$EnumWith$Dollar_UnderScoreSerializer
    implements PrimitiveSerializer<EnumWith$Dollar_UnderScore> {
  static const Map<String, Object> _toWire = const <String, Object>{
    '\$value': 0,
    'value\$': -1,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    0: '\$value',
    -1: 'value\$',
  };

  @override
  final Iterable<Type> types = const <Type>[EnumWith$Dollar_UnderScore];
  @override
  final String wireName = 'EnumWith\$Dollar_UnderScore';

  @override
  Object serialize(Serializers serializers, EnumWith$Dollar_UnderScore object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  EnumWith$Dollar_UnderScore deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      EnumWith$Dollar_UnderScore.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
