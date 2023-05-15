// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum_source_library.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EnumSourceLibrary extends EnumSourceLibrary {
  @override
  final LibraryElement element;
  ParsedLibraryResult? __parsedLibrary;
  String? __name;
  String? __fileName;
  String? __source;
  BuiltList<EnumSourceClass>? __classes;

  factory _$EnumSourceLibrary(
          [void Function(EnumSourceLibraryBuilder)? updates]) =>
      (new EnumSourceLibraryBuilder()..update(updates))._build();

  _$EnumSourceLibrary._({required this.element}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        element, r'EnumSourceLibrary', 'element');
  }

  @override
  ParsedLibraryResult get parsedLibrary =>
      __parsedLibrary ??= super.parsedLibrary;

  @override
  String get name => __name ??= super.name;

  @override
  String get fileName => __fileName ??= super.fileName;

  @override
  String get source => __source ??= super.source;

  @override
  BuiltList<EnumSourceClass> get classes => __classes ??= super.classes;

  @override
  EnumSourceLibrary rebuild(void Function(EnumSourceLibraryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EnumSourceLibraryBuilder toBuilder() =>
      new EnumSourceLibraryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EnumSourceLibrary && element == other.element;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, element.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'EnumSourceLibrary')
          ..add('element', element))
        .toString();
  }
}

class EnumSourceLibraryBuilder
    implements Builder<EnumSourceLibrary, EnumSourceLibraryBuilder> {
  _$EnumSourceLibrary? _$v;

  LibraryElement? _element;
  LibraryElement? get element => _$this._element;
  set element(LibraryElement? element) => _$this._element = element;

  EnumSourceLibraryBuilder();

  EnumSourceLibraryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _element = $v.element;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnumSourceLibrary other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EnumSourceLibrary;
  }

  @override
  void update(void Function(EnumSourceLibraryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EnumSourceLibrary build() => _build();

  _$EnumSourceLibrary _build() {
    final _$result = _$v ??
        new _$EnumSourceLibrary._(
            element: BuiltValueNullFieldError.checkNotNull(
                element, r'EnumSourceLibrary', 'element'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
