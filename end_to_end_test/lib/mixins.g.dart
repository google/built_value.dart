// GENERATED CODE - DO NOT MODIFY BY HAND

part of mixins;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_returning_this
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

Serializer<UsesMixin> _$usesMixinSerializer = new _$UsesMixinSerializer();

class _$UsesMixinSerializer implements StructuredSerializer<UsesMixin> {
  @override
  final Iterable<Type> types = const [UsesMixin, _$UsesMixin];
  @override
  final String wireName = 'UsesMixin';

  @override
  Iterable serialize(Serializers serializers, UsesMixin object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  UsesMixin deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new UsesMixinBuilder().build();
  }
}

class _$UsesMixin extends UsesMixin {
  @override
  final String Function(String) typeDef;

  factory _$UsesMixin([void updates(UsesMixinBuilder b)]) =>
      (new UsesMixinBuilder()..update(updates)).build();

  _$UsesMixin._({this.typeDef}) : super._() {
    if (typeDef == null)
      throw new BuiltValueNullFieldError('UsesMixin', 'typeDef');
  }

  @override
  UsesMixin rebuild(void updates(UsesMixinBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UsesMixinBuilder toBuilder() => new UsesMixinBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! UsesMixin) return false;
    return typeDef == other.typeDef;
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
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$UsesMixin;
  }

  @override
  void update(void updates(UsesMixinBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$UsesMixin build() {
    final _$result = _$v ?? new _$UsesMixin._(typeDef: typeDef);
    replace(_$result);
    return _$result;
  }
}
