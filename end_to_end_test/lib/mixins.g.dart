// GENERATED CODE - DO NOT MODIFY BY HAND

// @dart=2.8
part of mixins;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// NNBD? false
Serializer<UsesMixin> _$usesMixinSerializer = new _$UsesMixinSerializer();

class _$UsesMixinSerializer implements StructuredSerializer<UsesMixin> {
  @override
  final Iterable<Type> types = const [UsesMixin, _$UsesMixin];
  @override
  final String wireName = 'UsesMixin';

  @override
  Iterable<Object> serialize(Serializers serializers, UsesMixin object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  UsesMixin deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new UsesMixinBuilder().build();
  }
}

class _$UsesMixin extends UsesMixin {
  @override
  final String Function(String) typeDef;

  factory _$UsesMixin([void Function(UsesMixinBuilder) updates]) =>
      (new UsesMixinBuilder()..update(updates)).build();

  _$UsesMixin._({this.typeDef}) : super._() {
    if (typeDef == null) {
      throw new BuiltValueNullFieldError('UsesMixin', 'typeDef');
    }
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
    return (newBuiltValueToStringHelper('UsesMixin')..add('typeDef', typeDef))
        .toString();
  }
}

class UsesMixinBuilder implements Builder<UsesMixin, UsesMixinBuilder> {
  _$UsesMixin _$v;

  String Function(String) _typeDef;
  String Function(String) get typeDef => _$this._typeDef;
  set typeDef(String Function(String) typeDef) => _$this._typeDef = typeDef;

  UsesMixinBuilder();

  UsesMixinBuilder get _$this {
    if (_$v != null) {
      _typeDef = _$v.typeDef;
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
  void update(void Function(UsesMixinBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UsesMixin build() {
    final _$result = _$v ?? new _$UsesMixin._(typeDef: typeDef);
    replace(_$result);
    return _$result;
  }
}

class _$GetsCorrectFieldsViaMixins extends GetsCorrectFieldsViaMixins {
  @override
  final int shouldBeAField;

  factory _$GetsCorrectFieldsViaMixins(
          [void Function(GetsCorrectFieldsViaMixinsBuilder) updates]) =>
      (new GetsCorrectFieldsViaMixinsBuilder()..update(updates)).build();

  _$GetsCorrectFieldsViaMixins._({this.shouldBeAField}) : super._() {
    if (shouldBeAField == null) {
      throw new BuiltValueNullFieldError(
          'GetsCorrectFieldsViaMixins', 'shouldBeAField');
    }
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
    return (newBuiltValueToStringHelper('GetsCorrectFieldsViaMixins')
          ..add('shouldBeAField', shouldBeAField))
        .toString();
  }
}

class GetsCorrectFieldsViaMixinsBuilder
    implements
        Builder<GetsCorrectFieldsViaMixins, GetsCorrectFieldsViaMixinsBuilder> {
  _$GetsCorrectFieldsViaMixins _$v;

  int _shouldBeAField;
  int get shouldBeAField => _$this._shouldBeAField;
  set shouldBeAField(int shouldBeAField) =>
      _$this._shouldBeAField = shouldBeAField;

  GetsCorrectFieldsViaMixinsBuilder();

  GetsCorrectFieldsViaMixinsBuilder get _$this {
    if (_$v != null) {
      _shouldBeAField = _$v.shouldBeAField;
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
  void update(void Function(GetsCorrectFieldsViaMixinsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GetsCorrectFieldsViaMixins build() {
    final _$result = _$v ??
        new _$GetsCorrectFieldsViaMixins._(shouldBeAField: shouldBeAField);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
