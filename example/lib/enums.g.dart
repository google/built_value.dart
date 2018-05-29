// This is generated code; please do not modify by hand.

part of enums;

// **************************************************************************
// Generator: BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_returning_this
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

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

class _$TestEnumMeta {
  const _$TestEnumMeta();
  TestEnum get yes => _$yes;
  TestEnum get no => _$no;
  TestEnum get maybe => _$maybe;
  TestEnum valueOf(String name) => _$valueOf(name);
  BuiltSet<TestEnum> get values => _$values;
}

abstract class _$TestEnumMixin {
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
          {FullType specifiedType: FullType.unspecified}) =>
      object.name;

  @override
  TestEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType: FullType.unspecified}) =>
      TestEnum.valueOf(serialized as String);
}

class _$WireNameEnumSerializer implements PrimitiveSerializer<WireNameEnum> {
  static const Map<String, String> _toWire = const <String, String>{
    'yes': 'y',
    'no': 'n',
    'definitely': 'd',
  };
  static const Map<String, String> _fromWire = const <String, String>{
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
          {FullType specifiedType: FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  WireNameEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType: FullType.unspecified}) =>
      WireNameEnum.valueOf(_fromWire[serialized] ?? serialized as String);
}
