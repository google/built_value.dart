// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.enum_source_library;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EnumSourceLibrary extends EnumSourceLibrary {
  @override
  final LibraryElement element;
  ParsedLibraryResult __parsedLibrary;
  String __name;
  String __fileName;
  String __source;
  BuiltList<EnumSourceClass> __classes;

  factory _$EnumSourceLibrary([void updates(EnumSourceLibraryBuilder b)]) =>
      (new EnumSourceLibraryBuilder()..update(updates)).build();

  _$EnumSourceLibrary._({this.element}) : super._() {
    if (element == null) {
      throw new BuiltValueNullFieldError('EnumSourceLibrary', 'element');
    }
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
  EnumSourceLibrary rebuild(void updates(EnumSourceLibraryBuilder b)) =>
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
    return (newBuiltValueToStringHelper('EnumSourceLibrary')
          ..add('element', element))
        .toString();
  }
}

class EnumSourceLibraryBuilder
    implements Builder<EnumSourceLibrary, EnumSourceLibraryBuilder> {
  _$EnumSourceLibrary _$v;

  LibraryElement _element;
  LibraryElement get element => _$this._element;
  set element(LibraryElement element) => _$this._element = element;

  EnumSourceLibraryBuilder();

  EnumSourceLibraryBuilder get _$this {
    if (_$v != null) {
      _element = _$v.element;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnumSourceLibrary other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EnumSourceLibrary;
  }

  @override
  void update(void updates(EnumSourceLibraryBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$EnumSourceLibrary build() {
    final _$result = _$v ?? new _$EnumSourceLibrary._(element: element);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
