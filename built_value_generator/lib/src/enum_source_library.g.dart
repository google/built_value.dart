// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.enum_source_library;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class EnumSourceLibrary
// **************************************************************************

class _$EnumSourceLibrary extends EnumSourceLibrary {
  @override
  final String name;
  @override
  final String fileName;
  @override
  final String source;
  @override
  final BuiltList<EnumSourceClass> classes;

  factory _$EnumSourceLibrary([void updates(EnumSourceLibraryBuilder b)]) =>
      (new EnumSourceLibraryBuilder()..update(updates)).build();

  _$EnumSourceLibrary._({this.name, this.fileName, this.source, this.classes})
      : super._() {
    if (name == null) throw new ArgumentError.notNull('name');
    if (fileName == null) throw new ArgumentError.notNull('fileName');
    if (source == null) throw new ArgumentError.notNull('source');
    if (classes == null) throw new ArgumentError.notNull('classes');
  }

  @override
  EnumSourceLibrary rebuild(void updates(EnumSourceLibraryBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  EnumSourceLibraryBuilder toBuilder() =>
      new EnumSourceLibraryBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! EnumSourceLibrary) return false;
    return name == other.name &&
        fileName == other.fileName &&
        source == other.source &&
        classes == other.classes;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), fileName.hashCode), source.hashCode),
        classes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EnumSourceLibrary')
          ..add('name', name)
          ..add('fileName', fileName)
          ..add('source', source)
          ..add('classes', classes))
        .toString();
  }
}

class EnumSourceLibraryBuilder
    implements Builder<EnumSourceLibrary, EnumSourceLibraryBuilder> {
  _$EnumSourceLibrary _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _fileName;
  String get fileName => _$this._fileName;
  set fileName(String fileName) => _$this._fileName = fileName;

  String _source;
  String get source => _$this._source;
  set source(String source) => _$this._source = source;

  ListBuilder<EnumSourceClass> _classes;
  ListBuilder<EnumSourceClass> get classes =>
      _$this._classes ??= new ListBuilder<EnumSourceClass>();
  set classes(ListBuilder<EnumSourceClass> classes) =>
      _$this._classes = classes;

  EnumSourceLibraryBuilder();

  EnumSourceLibraryBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _fileName = _$v.fileName;
      _source = _$v.source;
      _classes = _$v.classes?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnumSourceLibrary other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$EnumSourceLibrary;
  }

  @override
  void update(void updates(EnumSourceLibraryBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$EnumSourceLibrary build() {
    final result = _$v ??
        new _$EnumSourceLibrary._(
            name: name,
            fileName: fileName,
            source: source,
            classes: classes?.build());
    replace(result);
    return result;
  }
}
