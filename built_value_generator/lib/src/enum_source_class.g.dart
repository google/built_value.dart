// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum_source_class.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EnumSourceClass extends EnumSourceClass {
  @override
  final ParsedLibraryResults parsedLibraryResults;
  @override
  final InterfaceElement element;
  ParsedLibraryResult? __parsedLibrary;
  String? __name;
  String? __wireName;
  BuiltValueEnum? __settings;
  bool? __isAbstract;
  BuiltList<EnumSourceField>? __fields;
  BuiltList<String>? __constructors;
  String? __valuesIdentifier;
  bool ___valuesIdentifier = false;
  String? __valueOfIdentifier;
  bool ___valueOfIdentifier = false;
  bool? __usesMixin;
  Iterable<String>? __identifiers;

  factory _$EnumSourceClass([void Function(EnumSourceClassBuilder)? updates]) =>
      (EnumSourceClassBuilder()..update(updates))._build();

  _$EnumSourceClass._(
      {required this.parsedLibraryResults, required this.element})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        parsedLibraryResults, r'EnumSourceClass', 'parsedLibraryResults');
    BuiltValueNullFieldError.checkNotNull(
        element, r'EnumSourceClass', 'element');
  }

  @override
  ParsedLibraryResult get parsedLibrary =>
      __parsedLibrary ??= super.parsedLibrary;

  @override
  String get name => __name ??= super.name;

  @override
  String get wireName => __wireName ??= super.wireName;

  @override
  BuiltValueEnum get settings => __settings ??= super.settings;

  @override
  bool get isAbstract => __isAbstract ??= super.isAbstract;

  @override
  BuiltList<EnumSourceField> get fields => __fields ??= super.fields;

  @override
  BuiltList<String> get constructors => __constructors ??= super.constructors;

  @override
  String? get valuesIdentifier {
    if (!___valuesIdentifier) {
      __valuesIdentifier = super.valuesIdentifier;
      ___valuesIdentifier = true;
    }
    return __valuesIdentifier;
  }

  @override
  String? get valueOfIdentifier {
    if (!___valueOfIdentifier) {
      __valueOfIdentifier = super.valueOfIdentifier;
      ___valueOfIdentifier = true;
    }
    return __valueOfIdentifier;
  }

  @override
  bool get usesMixin => __usesMixin ??= super.usesMixin;

  @override
  Iterable<String> get identifiers => __identifiers ??= super.identifiers;

  @override
  EnumSourceClass rebuild(void Function(EnumSourceClassBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EnumSourceClassBuilder toBuilder() => EnumSourceClassBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EnumSourceClass &&
        parsedLibraryResults == other.parsedLibraryResults &&
        element == other.element;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, parsedLibraryResults.hashCode);
    _$hash = $jc(_$hash, element.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EnumSourceClass')
          ..add('parsedLibraryResults', parsedLibraryResults)
          ..add('element', element))
        .toString();
  }
}

class EnumSourceClassBuilder
    implements Builder<EnumSourceClass, EnumSourceClassBuilder> {
  _$EnumSourceClass? _$v;

  ParsedLibraryResults? _parsedLibraryResults;
  ParsedLibraryResults? get parsedLibraryResults =>
      _$this._parsedLibraryResults;
  set parsedLibraryResults(ParsedLibraryResults? parsedLibraryResults) =>
      _$this._parsedLibraryResults = parsedLibraryResults;

  InterfaceElement? _element;
  InterfaceElement? get element => _$this._element;
  set element(InterfaceElement? element) => _$this._element = element;

  EnumSourceClassBuilder();

  EnumSourceClassBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _parsedLibraryResults = $v.parsedLibraryResults;
      _element = $v.element;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnumSourceClass other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EnumSourceClass;
  }

  @override
  void update(void Function(EnumSourceClassBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EnumSourceClass build() => _build();

  _$EnumSourceClass _build() {
    final _$result = _$v ??
        _$EnumSourceClass._(
          parsedLibraryResults: BuiltValueNullFieldError.checkNotNull(
              parsedLibraryResults, r'EnumSourceClass', 'parsedLibraryResults'),
          element: BuiltValueNullFieldError.checkNotNull(
              element, r'EnumSourceClass', 'element'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
