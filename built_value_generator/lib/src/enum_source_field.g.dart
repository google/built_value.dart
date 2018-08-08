// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.enum_source_field;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

class _$EnumSourceField extends EnumSourceField {
  @override
  final FieldElement element;
  String __name;
  String __type;
  BuiltValueEnumConst __settings;
  String __generatedIdentifier;
  bool __isConst;
  bool __isStatic;

  factory _$EnumSourceField([void updates(EnumSourceFieldBuilder b)]) =>
      (new EnumSourceFieldBuilder()..update(updates)).build();

  _$EnumSourceField._({this.element}) : super._() {
    if (element == null)
      throw new BuiltValueNullFieldError('EnumSourceField', 'element');
  }

  @override
  String get name => __name ??= super.name;

  @override
  String get type => __type ??= super.type;

  @override
  BuiltValueEnumConst get settings => __settings ??= super.settings;

  @override
  String get generatedIdentifier =>
      __generatedIdentifier ??= super.generatedIdentifier;

  @override
  bool get isConst => __isConst ??= super.isConst;

  @override
  bool get isStatic => __isStatic ??= super.isStatic;

  @override
  EnumSourceField rebuild(void updates(EnumSourceFieldBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  EnumSourceFieldBuilder toBuilder() =>
      new EnumSourceFieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EnumSourceField && element == other.element;
  }

  @override
  int get hashCode {
    return $jf($jc(0, element.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EnumSourceField')
          ..add('element', element))
        .toString();
  }
}

class EnumSourceFieldBuilder
    implements Builder<EnumSourceField, EnumSourceFieldBuilder> {
  _$EnumSourceField _$v;

  FieldElement _element;
  FieldElement get element => _$this._element;
  set element(FieldElement element) => _$this._element = element;

  EnumSourceFieldBuilder();

  EnumSourceFieldBuilder get _$this {
    if (_$v != null) {
      _element = _$v.element;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnumSourceField other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$EnumSourceField;
  }

  @override
  void update(void updates(EnumSourceFieldBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$EnumSourceField build() {
    final _$result = _$v ?? new _$EnumSourceField._(element: element);
    replace(_$result);
    return _$result;
  }
}
