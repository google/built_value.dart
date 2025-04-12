// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum_source_field.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EnumSourceField extends EnumSourceField {
  @override
  final ParsedLibraryResult parsedLibrary;
  @override
  final FieldElement element;
  String? __name;
  String? __type;
  bool ___type = false;
  BuiltValueEnumConst? __settings;
  String? __generatedIdentifier;
  bool? __isConst;
  bool? __isStatic;

  factory _$EnumSourceField([void Function(EnumSourceFieldBuilder)? updates]) =>
      (EnumSourceFieldBuilder()..update(updates))._build();

  _$EnumSourceField._({required this.parsedLibrary, required this.element})
      : super._();
  @override
  String get name => __name ??= super.name;

  @override
  String? get type {
    if (!___type) {
      __type = super.type;
      ___type = true;
    }
    return __type;
  }

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
  EnumSourceField rebuild(void Function(EnumSourceFieldBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EnumSourceFieldBuilder toBuilder() => EnumSourceFieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EnumSourceField &&
        parsedLibrary == other.parsedLibrary &&
        element == other.element;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, parsedLibrary.hashCode);
    _$hash = $jc(_$hash, element.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EnumSourceField')
          ..add('parsedLibrary', parsedLibrary)
          ..add('element', element))
        .toString();
  }
}

class EnumSourceFieldBuilder
    implements Builder<EnumSourceField, EnumSourceFieldBuilder> {
  _$EnumSourceField? _$v;

  ParsedLibraryResult? _parsedLibrary;
  ParsedLibraryResult? get parsedLibrary => _$this._parsedLibrary;
  set parsedLibrary(ParsedLibraryResult? parsedLibrary) =>
      _$this._parsedLibrary = parsedLibrary;

  FieldElement? _element;
  FieldElement? get element => _$this._element;
  set element(FieldElement? element) => _$this._element = element;

  EnumSourceFieldBuilder();

  EnumSourceFieldBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _parsedLibrary = $v.parsedLibrary;
      _element = $v.element;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnumSourceField other) {
    _$v = other as _$EnumSourceField;
  }

  @override
  void update(void Function(EnumSourceFieldBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EnumSourceField build() => _build();

  _$EnumSourceField _build() {
    final _$result = _$v ??
        _$EnumSourceField._(
          parsedLibrary: BuiltValueNullFieldError.checkNotNull(
              parsedLibrary, r'EnumSourceField', 'parsedLibrary'),
          element: BuiltValueNullFieldError.checkNotNull(
              element, r'EnumSourceField', 'element'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
