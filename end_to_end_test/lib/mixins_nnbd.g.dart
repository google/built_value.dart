// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'mixins_nnbd.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsesMixin> _$usesMixinSerializer = new _$UsesMixinSerializer();

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
    return new UsesMixinBuilder().build();
  }
}

class _$UsesMixin extends UsesMixin {
  @override
  final String Function(String) typeDef;

  factory _$UsesMixin([void Function(UsesMixinBuilder)? updates]) =>
      (new UsesMixinBuilder()..update(updates))._build();

  _$UsesMixin._({required this.typeDef}) : super._() {
    BuiltValueNullFieldError.checkNotNull(typeDef, r'UsesMixin', 'typeDef');
  }

  @override
  UsesMixin rebuild(void Function(UsesMixinBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsesMixinBuilder toBuilder() => new UsesMixinBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is UsesMixin && typeDef == _$dynamicOther.typeDef;
  }

  @override
  int get hashCode {
    return $jf($jc(0, typeDef.hashCode));
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
    ArgumentError.checkNotNull(other, 'other');
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
        new _$UsesMixin._(
            typeDef: BuiltValueNullFieldError.checkNotNull(
                typeDef, r'UsesMixin', 'typeDef'));
    replace(_$result);
    return _$result;
  }
}

class _$GetsCorrectFieldsViaMixins extends GetsCorrectFieldsViaMixins {
  @override
  final int shouldBeAField;

  factory _$GetsCorrectFieldsViaMixins(
          [void Function(GetsCorrectFieldsViaMixinsBuilder)? updates]) =>
      (new GetsCorrectFieldsViaMixinsBuilder()..update(updates))._build();

  _$GetsCorrectFieldsViaMixins._({required this.shouldBeAField}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        shouldBeAField, r'GetsCorrectFieldsViaMixins', 'shouldBeAField');
  }

  @override
  GetsCorrectFieldsViaMixins rebuild(
          void Function(GetsCorrectFieldsViaMixinsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetsCorrectFieldsViaMixinsBuilder toBuilder() =>
      new GetsCorrectFieldsViaMixinsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetsCorrectFieldsViaMixins &&
        shouldBeAField == other.shouldBeAField;
  }

  @override
  int get hashCode {
    return $jf($jc(0, shouldBeAField.hashCode));
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
    ArgumentError.checkNotNull(other, 'other');
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
        new _$GetsCorrectFieldsViaMixins._(
            shouldBeAField: BuiltValueNullFieldError.checkNotNull(
                shouldBeAField,
                r'GetsCorrectFieldsViaMixins',
                'shouldBeAField'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
