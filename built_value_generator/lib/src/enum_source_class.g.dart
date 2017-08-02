// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.enum_source_class;

// **************************************************************************
// Generator: BuiltValueGenerator
// **************************************************************************

// ignore_for_file: annotate_overrides
class _$EnumSourceClass extends EnumSourceClass {
  @override
  final ClassElement element;
  String __name;
  bool __isAbstract;
  BuiltList<EnumSourceField> __fields;
  BuiltList<String> __constructors;
  String __valuesIdentifier;
  String __valueOfIdentifier;
  bool __usesMixin;
  String __mixinDeclaration;
  Iterable<String> __identifiers;

  factory _$EnumSourceClass([void updates(EnumSourceClassBuilder b)]) =>
      (new EnumSourceClassBuilder()..update(updates)).build();

  _$EnumSourceClass._({this.element}) : super._() {
    if (element == null) throw new ArgumentError.notNull('element');
  }

  @override
  String get name => __name ??= super.name;

  @override
  bool get isAbstract => __isAbstract ??= super.isAbstract;

  @override
  BuiltList<EnumSourceField> get fields => __fields ??= super.fields;

  @override
  BuiltList<String> get constructors => __constructors ??= super.constructors;

  @override
  String get valuesIdentifier => __valuesIdentifier ??= super.valuesIdentifier;

  @override
  String get valueOfIdentifier =>
      __valueOfIdentifier ??= super.valueOfIdentifier;

  @override
  bool get usesMixin => __usesMixin ??= super.usesMixin;

  @override
  String get mixinDeclaration => __mixinDeclaration ??= super.mixinDeclaration;

  @override
  Iterable<String> get identifiers => __identifiers ??= super.identifiers;

  @override
  EnumSourceClass rebuild(void updates(EnumSourceClassBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  EnumSourceClassBuilder toBuilder() =>
      new EnumSourceClassBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! EnumSourceClass) return false;
    return element == other.element;
  }

  @override
  int get hashCode {
    return $jf($jc(0, element.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EnumSourceClass')
          ..add('element', element))
        .toString();
  }
}

class EnumSourceClassBuilder
    implements Builder<EnumSourceClass, EnumSourceClassBuilder> {
  _$EnumSourceClass _$v;

  ClassElement _element;
  ClassElement get element => _$this._element;
  set element(ClassElement element) => _$this._element = element;

  EnumSourceClassBuilder();

  EnumSourceClassBuilder get _$this {
    if (_$v != null) {
      _element = _$v.element;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnumSourceClass other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$EnumSourceClass;
  }

  @override
  void update(void updates(EnumSourceClassBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$EnumSourceClass build() {
    final result = _$v ?? new _$EnumSourceClass._(element: element);
    replace(result);
    return result;
  }
}
