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

  factory _$EnumSourceLibrary([updates(EnumSourceLibraryBuilder b)]) =>
      (new EnumSourceLibraryBuilder()..update(updates)).build();

  _$EnumSourceLibrary._({this.name, this.fileName, this.source, this.classes})
      : super._() {
    if (name == null) throw new ArgumentError.notNull('name');
    if (fileName == null) throw new ArgumentError.notNull('fileName');
    if (source == null) throw new ArgumentError.notNull('source');
    if (classes == null) throw new ArgumentError.notNull('classes');
  }

  @override
  EnumSourceLibrary rebuild(updates(EnumSourceLibraryBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  EnumSourceLibraryBuilder toBuilder() =>
      new EnumSourceLibraryBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
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
    return 'EnumSourceLibrary {'
        'name=${name.toString()},\n'
        'fileName=${fileName.toString()},\n'
        'source=${source.toString()},\n'
        'classes=${classes.toString()},\n'
        '}';
  }
}

class EnumSourceLibraryBuilder
    implements Builder<EnumSourceLibrary, EnumSourceLibraryBuilder> {
  EnumSourceLibrary _$v;

  String _name;
  String get name => _name;
  set name(String name) => _$writableBuilder._name = name;

  String _fileName;
  String get fileName => _fileName;
  set fileName(String fileName) => _$writableBuilder._fileName = fileName;

  String _source;
  String get source => _source;
  set source(String source) => _$writableBuilder._source = source;

  ListBuilder<EnumSourceClass> _classes;
  ListBuilder<EnumSourceClass> get classes =>
      _$writableBuilder._classes ??= new ListBuilder<EnumSourceClass>();
  set classes(ListBuilder<EnumSourceClass> classes) =>
      _$writableBuilder._classes = classes;

  EnumSourceLibraryBuilder();

  EnumSourceLibraryBuilder get _$writableBuilder {
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
    _$v = other;
  }

  @override
  void update(updates(EnumSourceLibraryBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  EnumSourceLibrary build() {
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
