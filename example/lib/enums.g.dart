// GENERATED CODE - DO NOT MODIFY BY HAND

part of enums;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: library enums
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

final BuiltSet<TestEnum> _$values = new BuiltSet<TestEnum>(const [
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
const SecondTestEnum _$noThanks = const SecondTestEnum._('no-thanks');

SecondTestEnum _$vlOf(String name) {
  switch (name) {
    case 'yes':
      return _$ys;
    case 'no':
      return _$n;
    case 'definitely':
      return _$definitely;
    case 'no-thanks':
      return _$noThanks;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<SecondTestEnum> _$vls = new BuiltSet<SecondTestEnum>(const [
  _$ys,
  _$n,
  _$definitely,
  _$noThanks,
]);

Serializer<TestEnum> _$testEnumSerializer = new _$TestEnumSerializer();
Serializer<SecondTestEnum> _$secondTestEnumSerializer =
    new _$SecondTestEnumSerializer();
Serializer<ValueUsingEnum> _$valueUsingEnumSerializer =
    new _$ValueUsingEnumSerializer();

class _$TestEnumSerializer implements PrimitiveSerializer<TestEnum> {
  @override
  final Iterable<Type> types = const [TestEnum];
  @override
  final String wireName = 'TestEnum';

  @override
  Object serialize(Serializers serializers, TestEnum object,
      {FullType specifiedType: FullType.unspecified}) {
    return object.name;
  }

  @override
  TestEnum deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType: FullType.unspecified}) {
    return TestEnum.valueOf(serialized as String);
  }
}

class _$SecondTestEnumSerializer
    implements PrimitiveSerializer<SecondTestEnum> {
  @override
  final Iterable<Type> types = const [SecondTestEnum];
  @override
  final String wireName = 'SecondTestEnum';

  @override
  Object serialize(Serializers serializers, SecondTestEnum object,
      {FullType specifiedType: FullType.unspecified}) {
    return object.name;
  }

  @override
  SecondTestEnum deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType: FullType.unspecified}) {
    return SecondTestEnum.valueOf(serialized as String);
  }
}

class _$ValueUsingEnumSerializer
    implements StructuredSerializer<ValueUsingEnum> {
  @override
  final Iterable<Type> types = const [ValueUsingEnum, _$ValueUsingEnum];
  @override
  final String wireName = 'ValueUsingEnum';

  @override
  Iterable serialize(Serializers serializers, ValueUsingEnum object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = <Object>[
      'answer',
      serializers.serialize(object.answer,
          specifiedType: const FullType(SecondTestEnum)),
    ];

    return result;
  }

  @override
  ValueUsingEnum deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new ValueUsingEnumBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'answer':
          result.answer = serializers.deserialize(value,
              specifiedType: const FullType(SecondTestEnum)) as SecondTestEnum;
          break;
      }
    }

    return result.build();
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class ValueUsingEnum
// **************************************************************************

class _$ValueUsingEnum extends ValueUsingEnum {
  @override
  final SecondTestEnum answer;

  factory _$ValueUsingEnum([void updates(ValueUsingEnumBuilder b)]) =>
      (new ValueUsingEnumBuilder()..update(updates)).build();

  _$ValueUsingEnum._({this.answer}) : super._() {
    if (answer == null) throw new ArgumentError.notNull('answer');
  }

  @override
  ValueUsingEnum rebuild(void updates(ValueUsingEnumBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ValueUsingEnumBuilder toBuilder() =>
      new ValueUsingEnumBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! ValueUsingEnum) return false;
    return answer == other.answer;
  }

  @override
  int get hashCode {
    return $jf($jc(0, answer.hashCode));
  }

  @override
  String toString() {
    return 'ValueUsingEnum {'
        'answer=${answer.toString()},\n'
        '}';
  }
}

class ValueUsingEnumBuilder
    implements Builder<ValueUsingEnum, ValueUsingEnumBuilder> {
  _$ValueUsingEnum _$v;

  SecondTestEnum _answer;
  SecondTestEnum get answer => _$this._answer;
  set answer(SecondTestEnum answer) => _$this._answer = answer;

  ValueUsingEnumBuilder();

  ValueUsingEnumBuilder get _$this {
    if (_$v != null) {
      _answer = _$v.answer;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueUsingEnum other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$ValueUsingEnum;
  }

  @override
  void update(void updates(ValueUsingEnumBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ValueUsingEnum build() {
    final result = _$v ?? new _$ValueUsingEnum._(answer: answer);
    replace(result);
    return result;
  }
}
