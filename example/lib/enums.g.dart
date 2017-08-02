// GENERATED CODE - DO NOT MODIFY BY HAND

part of enums;

// **************************************************************************
// Generator: BuiltValueGenerator
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

Serializer<TestEnum> _$testEnumSerializer = new _$TestEnumSerializer();

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
