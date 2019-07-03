// GENERATED CODE - DO NOT MODIFY BY HAND

part of mixins;

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
    final _$dynamicOther = other as dynamic;
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
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
