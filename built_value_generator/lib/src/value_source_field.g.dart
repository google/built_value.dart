// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'value_source_field.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ValueSourceField extends ValueSourceField {
  @override
  final ParsedLibraryResults parsedLibraryResults;
  @override
  final BuiltValue settings;
  @override
  final ParsedLibraryResult parsedLibrary;
  @override
  final FieldElement element;
  @override
  final FieldElement? builderElement;
  String? __name;
  String? __type;
  bool? __isFunctionType;
  String? __typeWithPrefix;
  bool? __isGetter;
  bool? __hasNullableAnnotation;
  bool? __hasNullableType;
  bool? __isNullable;
  BuiltValueField? __builtValueField;
  bool? __builderFieldIsNormalField;
  bool? __builderFieldIsGetterSetterPair;
  bool? __builderFieldIsAbstract;
  String? __fullBuildElementType;
  String? __buildElementType;
  String? __builderElementTypeWithPrefix;
  bool? __isNestedBuilder;
  bool? __isAutoCreateNestedBuilder;

  factory _$ValueSourceField(
          [void Function(ValueSourceFieldBuilder)? updates]) =>
      (ValueSourceFieldBuilder()..update(updates))._build();

  _$ValueSourceField._(
      {required this.parsedLibraryResults,
      required this.settings,
      required this.parsedLibrary,
      required this.element,
      this.builderElement})
      : super._();
  @override
  String get name => __name ??= super.name;

  @override
  String get type => __type ??= super.type;

  @override
  bool get isFunctionType => __isFunctionType ??= super.isFunctionType;

  @override
  String get typeWithPrefix => __typeWithPrefix ??= super.typeWithPrefix;

  @override
  bool get isGetter => __isGetter ??= super.isGetter;

  @override
  bool get hasNullableAnnotation =>
      __hasNullableAnnotation ??= super.hasNullableAnnotation;

  @override
  bool get hasNullableType => __hasNullableType ??= super.hasNullableType;

  @override
  bool get isNullable => __isNullable ??= super.isNullable;

  @override
  BuiltValueField get builtValueField =>
      __builtValueField ??= super.builtValueField;

  @override
  bool get builderFieldIsNormalField =>
      __builderFieldIsNormalField ??= super.builderFieldIsNormalField;

  @override
  bool get builderFieldIsGetterSetterPair =>
      __builderFieldIsGetterSetterPair ??= super.builderFieldIsGetterSetterPair;

  @override
  bool get builderFieldIsAbstract =>
      __builderFieldIsAbstract ??= super.builderFieldIsAbstract;

  @override
  String get fullBuildElementType =>
      __fullBuildElementType ??= super.fullBuildElementType;

  @override
  String get buildElementType => __buildElementType ??= super.buildElementType;

  @override
  String get builderElementTypeWithPrefix =>
      __builderElementTypeWithPrefix ??= super.builderElementTypeWithPrefix;

  @override
  bool get isNestedBuilder => __isNestedBuilder ??= super.isNestedBuilder;

  @override
  bool get isAutoCreateNestedBuilder =>
      __isAutoCreateNestedBuilder ??= super.isAutoCreateNestedBuilder;

  @override
  ValueSourceField rebuild(void Function(ValueSourceFieldBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValueSourceFieldBuilder toBuilder() =>
      ValueSourceFieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValueSourceField &&
        parsedLibraryResults == other.parsedLibraryResults &&
        settings == other.settings &&
        parsedLibrary == other.parsedLibrary &&
        element == other.element &&
        builderElement == other.builderElement;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, parsedLibraryResults.hashCode);
    _$hash = $jc(_$hash, settings.hashCode);
    _$hash = $jc(_$hash, parsedLibrary.hashCode);
    _$hash = $jc(_$hash, element.hashCode);
    _$hash = $jc(_$hash, builderElement.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ValueSourceField')
          ..add('parsedLibraryResults', parsedLibraryResults)
          ..add('settings', settings)
          ..add('parsedLibrary', parsedLibrary)
          ..add('element', element)
          ..add('builderElement', builderElement))
        .toString();
  }
}

class ValueSourceFieldBuilder
    implements Builder<ValueSourceField, ValueSourceFieldBuilder> {
  _$ValueSourceField? _$v;

  ParsedLibraryResults? _parsedLibraryResults;
  ParsedLibraryResults? get parsedLibraryResults =>
      _$this._parsedLibraryResults;
  set parsedLibraryResults(ParsedLibraryResults? parsedLibraryResults) =>
      _$this._parsedLibraryResults = parsedLibraryResults;

  BuiltValue? _settings;
  BuiltValue? get settings => _$this._settings;
  set settings(BuiltValue? settings) => _$this._settings = settings;

  ParsedLibraryResult? _parsedLibrary;
  ParsedLibraryResult? get parsedLibrary => _$this._parsedLibrary;
  set parsedLibrary(ParsedLibraryResult? parsedLibrary) =>
      _$this._parsedLibrary = parsedLibrary;

  FieldElement? _element;
  FieldElement? get element => _$this._element;
  set element(FieldElement? element) => _$this._element = element;

  FieldElement? _builderElement;
  FieldElement? get builderElement => _$this._builderElement;
  set builderElement(FieldElement? builderElement) =>
      _$this._builderElement = builderElement;

  ValueSourceFieldBuilder();

  ValueSourceFieldBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _parsedLibraryResults = $v.parsedLibraryResults;
      _settings = $v.settings;
      _parsedLibrary = $v.parsedLibrary;
      _element = $v.element;
      _builderElement = $v.builderElement;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValueSourceField other) {
    _$v = other as _$ValueSourceField;
  }

  @override
  void update(void Function(ValueSourceFieldBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ValueSourceField build() => _build();

  _$ValueSourceField _build() {
    final _$result = _$v ??
        _$ValueSourceField._(
          parsedLibraryResults: BuiltValueNullFieldError.checkNotNull(
              parsedLibraryResults,
              r'ValueSourceField',
              'parsedLibraryResults'),
          settings: BuiltValueNullFieldError.checkNotNull(
              settings, r'ValueSourceField', 'settings'),
          parsedLibrary: BuiltValueNullFieldError.checkNotNull(
              parsedLibrary, r'ValueSourceField', 'parsedLibrary'),
          element: BuiltValueNullFieldError.checkNotNull(
              element, r'ValueSourceField', 'element'),
          builderElement: builderElement,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
