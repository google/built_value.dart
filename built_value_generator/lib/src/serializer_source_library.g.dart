// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.source_library;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class SerializerSourceLibrary
// **************************************************************************

class _$SerializerSourceLibrary extends SerializerSourceLibrary {
  final bool hasSerializers;
  final BuiltSet<SerializerSourceClass> sourceClasses;
  final BuiltSet<SerializerSourceClass> transitiveSourceClasses;

  _$SerializerSourceLibrary._(
      {this.hasSerializers, this.sourceClasses, this.transitiveSourceClasses})
      : super._() {
    if (hasSerializers == null)
      throw new ArgumentError.notNull('hasSerializers');
    if (sourceClasses == null) throw new ArgumentError.notNull('sourceClasses');
    if (transitiveSourceClasses == null)
      throw new ArgumentError.notNull('transitiveSourceClasses');
  }

  factory _$SerializerSourceLibrary(
          [updates(SerializerSourceLibraryBuilder b)]) =>
      (new SerializerSourceLibraryBuilder()..update(updates)).build();

  SerializerSourceLibrary rebuild(updates(SerializerSourceLibraryBuilder b)) =>
      (toBuilder()..update(updates)).build();

  _$SerializerSourceLibraryBuilder toBuilder() =>
      new _$SerializerSourceLibraryBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! SerializerSourceLibrary) return false;
    return hasSerializers == other.hasSerializers &&
        sourceClasses == other.sourceClasses &&
        transitiveSourceClasses == other.transitiveSourceClasses;
  }

  int get hashCode {
    return $jf($jc($jc($jc(0, hasSerializers.hashCode), sourceClasses.hashCode),
        transitiveSourceClasses.hashCode));
  }

  String toString() {
    return 'SerializerSourceLibrary {'
        'hasSerializers=${hasSerializers.toString()},\n'
        'sourceClasses=${sourceClasses.toString()},\n'
        'transitiveSourceClasses=${transitiveSourceClasses.toString()},\n'
        '}';
  }
}

class _$SerializerSourceLibraryBuilder extends SerializerSourceLibraryBuilder {
  _$SerializerSourceLibraryBuilder() : super._();
  void replace(SerializerSourceLibrary other) {
    super.hasSerializers = other.hasSerializers;
    super.sourceClasses = other.sourceClasses?.toBuilder();
    super.transitiveSourceClasses = other.transitiveSourceClasses?.toBuilder();
  }

  void update(updates(SerializerSourceLibraryBuilder b)) {
    if (updates != null) updates(this);
  }

  SerializerSourceLibrary build() {
    return new _$SerializerSourceLibrary._(
        hasSerializers: hasSerializers,
        sourceClasses: sourceClasses?.build(),
        transitiveSourceClasses: transitiveSourceClasses?.build());
  }
}
