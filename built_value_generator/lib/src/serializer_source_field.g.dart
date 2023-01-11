// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.source_field;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SerializerSourceField extends SerializerSourceField {
  @override
  final BuiltValue settings;
  @override
  final ParsedLibraryResult parsedLibrary;
  @override
  final FieldElement element;
  @override
  final FieldElement? builderElement;
  bool? __isSerializable;
  BuiltValueField? __builtValueField;
  bool? __isNonNullByDefault;
  String? __orNull;
  bool? __hasNullableAnnotation;
  bool? __hasNullableType;
  bool? __isNullable;
  String? __name;
  String? __wireName;
  String? __type;
  String? __typeWithNullabilitySuffix;
  String? __typeWithPrefix;
  String? __typeWithPrefixAndNullabilitySuffix;
  bool? __builderFieldUsesNestedBuilder;
  bool? __builderFieldAutoCreatesNestedBuilder;
  String? __rawType;
  bool? __needsBuilder;

  factory _$SerializerSourceField(
          [void Function(SerializerSourceFieldBuilder)? updates]) =>
      (new SerializerSourceFieldBuilder()..update(updates))._build();

  _$SerializerSourceField._(
      {required this.settings,
      required this.parsedLibrary,
      required this.element,
      this.builderElement})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        settings, r'SerializerSourceField', 'settings');
    BuiltValueNullFieldError.checkNotNull(
        parsedLibrary, r'SerializerSourceField', 'parsedLibrary');
    BuiltValueNullFieldError.checkNotNull(
        element, r'SerializerSourceField', 'element');
  }

  @override
  bool get isSerializable => __isSerializable ??= super.isSerializable;

  @override
  BuiltValueField get builtValueField =>
      __builtValueField ??= super.builtValueField;

  @override
  bool get isNonNullByDefault =>
      __isNonNullByDefault ??= super.isNonNullByDefault;

  @override
  String get orNull => __orNull ??= super.orNull;

  @override
  bool get hasNullableAnnotation =>
      __hasNullableAnnotation ??= super.hasNullableAnnotation;

  @override
  bool get hasNullableType => __hasNullableType ??= super.hasNullableType;

  @override
  bool get isNullable => __isNullable ??= super.isNullable;

  @override
  String get name => __name ??= super.name;

  @override
  String get wireName => __wireName ??= super.wireName;

  @override
  String get type => __type ??= super.type;

  @override
  String get typeWithNullabilitySuffix =>
      __typeWithNullabilitySuffix ??= super.typeWithNullabilitySuffix;

  @override
  String get typeWithPrefix => __typeWithPrefix ??= super.typeWithPrefix;

  @override
  String get typeWithPrefixAndNullabilitySuffix =>
      __typeWithPrefixAndNullabilitySuffix ??=
          super.typeWithPrefixAndNullabilitySuffix;

  @override
  bool get builderFieldUsesNestedBuilder =>
      __builderFieldUsesNestedBuilder ??= super.builderFieldUsesNestedBuilder;

  @override
  bool get builderFieldAutoCreatesNestedBuilder =>
      __builderFieldAutoCreatesNestedBuilder ??=
          super.builderFieldAutoCreatesNestedBuilder;

  @override
  String get rawType => __rawType ??= super.rawType;

  @override
  bool get needsBuilder => __needsBuilder ??= super.needsBuilder;

  @override
  SerializerSourceField rebuild(
          void Function(SerializerSourceFieldBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SerializerSourceFieldBuilder toBuilder() =>
      new SerializerSourceFieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SerializerSourceField &&
        settings == other.settings &&
        parsedLibrary == other.parsedLibrary &&
        element == other.element &&
        builderElement == other.builderElement;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, settings.hashCode);
    _$hash = $jc(_$hash, parsedLibrary.hashCode);
    _$hash = $jc(_$hash, element.hashCode);
    _$hash = $jc(_$hash, builderElement.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SerializerSourceField')
          ..add('settings', settings)
          ..add('parsedLibrary', parsedLibrary)
          ..add('element', element)
          ..add('builderElement', builderElement))
        .toString();
  }
}

class SerializerSourceFieldBuilder
    implements Builder<SerializerSourceField, SerializerSourceFieldBuilder> {
  _$SerializerSourceField? _$v;

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

  SerializerSourceFieldBuilder();

  SerializerSourceFieldBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _settings = $v.settings;
      _parsedLibrary = $v.parsedLibrary;
      _element = $v.element;
      _builderElement = $v.builderElement;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SerializerSourceField other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SerializerSourceField;
  }

  @override
  void update(void Function(SerializerSourceFieldBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SerializerSourceField build() => _build();

  _$SerializerSourceField _build() {
    final _$result = _$v ??
        new _$SerializerSourceField._(
            settings: BuiltValueNullFieldError.checkNotNull(
                settings, r'SerializerSourceField', 'settings'),
            parsedLibrary: BuiltValueNullFieldError.checkNotNull(
                parsedLibrary, r'SerializerSourceField', 'parsedLibrary'),
            element: BuiltValueNullFieldError.checkNotNull(
                element, r'SerializerSourceField', 'element'),
            builderElement: builderElement);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
