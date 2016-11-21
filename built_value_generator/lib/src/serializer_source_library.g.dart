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
  SerializerSourceLibrary _$v;

  bool get hasSerializers => super.hasSerializers;
  set hasSerializers(bool hasSerializers) {
    _$writableBuilder;
    super.hasSerializers = hasSerializers;
  }

  SetBuilder<SerializerSourceClass> get sourceClasses {
    _$writableBuilder;
    return super.sourceClasses ??= new SetBuilder<SerializerSourceClass>();
  }

  set sourceClasses(SetBuilder<SerializerSourceClass> sourceClasses) {
    _$writableBuilder;
    super.sourceClasses = sourceClasses;
  }

  SetBuilder<SerializerSourceClass> get transitiveSourceClasses {
    _$writableBuilder;
    return super.transitiveSourceClasses ??=
        new SetBuilder<SerializerSourceClass>();
  }

  set transitiveSourceClasses(
      SetBuilder<SerializerSourceClass> transitiveSourceClasses) {
    _$writableBuilder;
    super.transitiveSourceClasses = transitiveSourceClasses;
  }

  _$SerializerSourceLibraryBuilder() : super._();

  SerializerSourceLibraryBuilder get _$writableBuilder {
    if (_$v != null) {
      super.hasSerializers = _$v.hasSerializers;
      super.sourceClasses = _$v.sourceClasses?.toBuilder();
      super.transitiveSourceClasses = _$v.transitiveSourceClasses?.toBuilder();
      _$v = null;
    }
    return this;
  }

  void replace(SerializerSourceLibrary other) {
    _$v = other;
  }

  void update(updates(SerializerSourceLibraryBuilder b)) {
    if (updates != null) updates(this);
  }

  SerializerSourceLibrary build() {
    final result = _$v ??
        new _$SerializerSourceLibrary._(
            hasSerializers: hasSerializers,
            sourceClasses: sourceClasses?.build(),
            transitiveSourceClasses: transitiveSourceClasses?.build());
    replace(result);
    return result;
  }
}
