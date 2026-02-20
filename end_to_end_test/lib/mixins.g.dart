// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'mixins.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsesMixin> _$usesMixinSerializer = _$UsesMixinSerializer();

class _$UsesMixinSerializer implements StructuredSerializer<UsesMixin> {
  @override
  final Iterable<Type> types = const [UsesMixin, _$UsesMixin];
  @override
  final String wireName = 'UsesMixin';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsesMixin object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  UsesMixin deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return UsesMixinBuilder().build();
  }
}

class _$UsesMixin extends UsesMixin {
  @override
  final String Function(String) typeDef;

  factory _$UsesMixin([void Function(UsesMixinBuilder)? updates]) =>
      (UsesMixinBuilder()..update(updates))._build();

  _$UsesMixin._({required this.typeDef}) : super._();
  @override
  UsesMixin rebuild(void Function(UsesMixinBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsesMixinBuilder toBuilder() => UsesMixinBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsesMixin && typeDef == other.typeDef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, typeDef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsesMixin')..add('typeDef', typeDef))
        .toString();
  }
}

class UsesMixinBuilder implements Builder<UsesMixin, UsesMixinBuilder> {
  _$UsesMixin? _$v;

  String Function(String)? _typeDef;
  String Function(String)? get typeDef => _$this._typeDef;
  set typeDef(String Function(String)? typeDef) => _$this._typeDef = typeDef;

  UsesMixinBuilder();

  UsesMixinBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _typeDef = $v.typeDef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsesMixin other) {
    _$v = other as _$UsesMixin;
  }

  @override
  void update(void Function(UsesMixinBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsesMixin build() => _build();

  _$UsesMixin _build() {
    final _$result = _$v ??
        _$UsesMixin._(
          typeDef: BuiltValueNullFieldError.checkNotNull(
              typeDef, r'UsesMixin', 'typeDef'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GetsCorrectFieldsViaMixins extends GetsCorrectFieldsViaMixins {
  @override
  final int shouldBeAField;

  factory _$GetsCorrectFieldsViaMixins(
          [void Function(GetsCorrectFieldsViaMixinsBuilder)? updates]) =>
      (GetsCorrectFieldsViaMixinsBuilder()..update(updates))._build();

  _$GetsCorrectFieldsViaMixins._({required this.shouldBeAField}) : super._();
  @override
  GetsCorrectFieldsViaMixins rebuild(
          void Function(GetsCorrectFieldsViaMixinsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetsCorrectFieldsViaMixinsBuilder toBuilder() =>
      GetsCorrectFieldsViaMixinsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetsCorrectFieldsViaMixins &&
        shouldBeAField == other.shouldBeAField;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, shouldBeAField.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetsCorrectFieldsViaMixins')
          ..add('shouldBeAField', shouldBeAField))
        .toString();
  }
}

class GetsCorrectFieldsViaMixinsBuilder
    implements
        Builder<GetsCorrectFieldsViaMixins, GetsCorrectFieldsViaMixinsBuilder> {
  _$GetsCorrectFieldsViaMixins? _$v;

  int? _shouldBeAField;
  int? get shouldBeAField => _$this._shouldBeAField;
  set shouldBeAField(int? shouldBeAField) =>
      _$this._shouldBeAField = shouldBeAField;

  GetsCorrectFieldsViaMixinsBuilder();

  GetsCorrectFieldsViaMixinsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _shouldBeAField = $v.shouldBeAField;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetsCorrectFieldsViaMixins other) {
    _$v = other as _$GetsCorrectFieldsViaMixins;
  }

  @override
  void update(void Function(GetsCorrectFieldsViaMixinsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetsCorrectFieldsViaMixins build() => _build();

  _$GetsCorrectFieldsViaMixins _build() {
    final _$result = _$v ??
        _$GetsCorrectFieldsViaMixins._(
          shouldBeAField: BuiltValueNullFieldError.checkNotNull(
              shouldBeAField, r'GetsCorrectFieldsViaMixins', 'shouldBeAField'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
