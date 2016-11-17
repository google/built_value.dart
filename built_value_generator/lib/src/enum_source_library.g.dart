// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.enum_source_library;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class EnumSourceLibrary
// **************************************************************************

class _$EnumSourceLibrary extends EnumSourceLibrary {
  final String name;
  final String fileName;
  final String source;
  final BuiltList<EnumSourceClass> classes;

  _$EnumSourceLibrary._({this.name, this.fileName, this.source, this.classes})
      : super._() {
    if (name == null) throw new ArgumentError.notNull('name');
    if (fileName == null) throw new ArgumentError.notNull('fileName');
    if (source == null) throw new ArgumentError.notNull('source');
    if (classes == null) throw new ArgumentError.notNull('classes');
  }

  factory _$EnumSourceLibrary([updates(EnumSourceLibraryBuilder b)]) =>
      (new EnumSourceLibraryBuilder()..update(updates)).build();

  EnumSourceLibrary rebuild(updates(EnumSourceLibraryBuilder b)) =>
      (toBuilder()..update(updates)).build();

  _$EnumSourceLibraryBuilder toBuilder() =>
      new _$EnumSourceLibraryBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! EnumSourceLibrary) return false;
    return name == other.name &&
        fileName == other.fileName &&
        source == other.source &&
        classes == other.classes;
  }

  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), fileName.hashCode), source.hashCode),
        classes.hashCode));
  }

  String toString() {
    return 'EnumSourceLibrary {'
        'name=${name.toString()},\n'
        'fileName=${fileName.toString()},\n'
        'source=${source.toString()},\n'
        'classes=${classes.toString()},\n'
        '}';
  }
}

class _$EnumSourceLibraryBuilder extends EnumSourceLibraryBuilder {
  _$EnumSourceLibraryBuilder() : super._();
  void replace(EnumSourceLibrary other) {
    super.name = other.name;
    super.fileName = other.fileName;
    super.source = other.source;
    super.classes = other.classes?.toBuilder();
  }

  void update(updates(EnumSourceLibraryBuilder b)) {
    if (updates != null) updates(this);
  }

  EnumSourceLibrary build() {
    return new _$EnumSourceLibrary._(
        name: name,
        fileName: fileName,
        source: source,
        classes: classes?.build());
  }
}
