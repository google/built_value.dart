// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.enum_source_library;

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
    return $jf($jc(0, element.hashCode));
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
