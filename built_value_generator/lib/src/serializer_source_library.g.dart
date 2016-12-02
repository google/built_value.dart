// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.source_library;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class SerializerSourceLibrary
// **************************************************************************

class _$SerializerSourceLibrary extends SerializerSourceLibrary {
  @override
  final bool hasSerializers;
  @override
  final BuiltSet<SerializerSourceClass> sourceClasses;
  @override
  final BuiltSet<SerializerSourceClass> transitiveSourceClasses;

  factory _$SerializerSourceLibrary(
          [updates(SerializerSourceLibraryBuilder b)]) =>
      (new SerializerSourceLibraryBuilder()..update(updates)).build();

  _$SerializerSourceLibrary._(
      {this.hasSerializers, this.sourceClasses, this.transitiveSourceClasses})
      : super._() {
    if (hasSerializers == null)
      throw new ArgumentError.notNull('hasSerializers');
    if (sourceClasses == null) throw new ArgumentError.notNull('sourceClasses');
    if (transitiveSourceClasses == null)
      throw new ArgumentError.notNull('transitiveSourceClasses');
  }

  @override
  SerializerSourceLibrary rebuild(updates(SerializerSourceLibraryBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  _$SerializerSourceLibraryBuilder toBuilder() =>
      new _$SerializerSourceLibraryBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! SerializerSourceLibrary) return false;
    return hasSerializers == other.hasSerializers &&
        sourceClasses == other.sourceClasses &&
        transitiveSourceClasses == other.transitiveSourceClasses;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, hasSerializers.hashCode), sourceClasses.hashCode),
        transitiveSourceClasses.hashCode));
  }

  @override
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

  @override
  bool get hasSerializers => super.hasSerializers;
  @override
  set hasSerializers(bool hasSerializers) {
    _$writableBuilder;
    super.hasSerializers = hasSerializers;
  }

  @override
  SetBuilder<SerializerSourceClass> get sourceClasses {
    _$writableBuilder;
    return super.sourceClasses ??= new SetBuilder<SerializerSourceClass>();
  }

  @override
  set sourceClasses(SetBuilder<SerializerSourceClass> sourceClasses) {
    _$writableBuilder;
    super.sourceClasses = sourceClasses;
  }

  @override
  SetBuilder<SerializerSourceClass> get transitiveSourceClasses {
    _$writableBuilder;
    return super.transitiveSourceClasses ??=
        new SetBuilder<SerializerSourceClass>();
  }

  @override
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

  @override
  void replace(SerializerSourceLibrary other) {
    _$v = other;
  }

  @override
  void update(updates(SerializerSourceLibraryBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
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
