// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.enum_source_field;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class EnumSourceField
// **************************************************************************

class _$EnumSourceField extends EnumSourceField {
  final String name;
  final String type;
  final String generatedIdentifier;
  final bool isConst;
  final bool isStatic;

  _$EnumSourceField._(
      {this.name,
      this.type,
      this.generatedIdentifier,
      this.isConst,
      this.isStatic})
      : super._() {
    if (name == null) throw new ArgumentError.notNull('name');
    if (type == null) throw new ArgumentError.notNull('type');
    if (generatedIdentifier == null)
      throw new ArgumentError.notNull('generatedIdentifier');
    if (isConst == null) throw new ArgumentError.notNull('isConst');
    if (isStatic == null) throw new ArgumentError.notNull('isStatic');
  }

  factory _$EnumSourceField([updates(EnumSourceFieldBuilder b)]) =>
      (new EnumSourceFieldBuilder()..update(updates)).build();

  EnumSourceField rebuild(updates(EnumSourceFieldBuilder b)) =>
      (toBuilder()..update(updates)).build();

  _$EnumSourceFieldBuilder toBuilder() =>
      new _$EnumSourceFieldBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! EnumSourceField) return false;
    return name == other.name &&
        type == other.type &&
        generatedIdentifier == other.generatedIdentifier &&
        isConst == other.isConst &&
        isStatic == other.isStatic;
  }

  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, name.hashCode), type.hashCode),
                generatedIdentifier.hashCode),
            isConst.hashCode),
        isStatic.hashCode));
  }

  String toString() {
    return 'EnumSourceField {'
        'name=${name.toString()},\n'
        'type=${type.toString()},\n'
        'generatedIdentifier=${generatedIdentifier.toString()},\n'
        'isConst=${isConst.toString()},\n'
        'isStatic=${isStatic.toString()},\n'
        '}';
  }
}

class _$EnumSourceFieldBuilder extends EnumSourceFieldBuilder {
  _$EnumSourceFieldBuilder() : super._();
  void replace(EnumSourceField other) {
    super.name = other.name;
    super.type = other.type;
    super.generatedIdentifier = other.generatedIdentifier;
    super.isConst = other.isConst;
    super.isStatic = other.isStatic;
  }

  void update(updates(EnumSourceFieldBuilder b)) {
    if (updates != null) updates(this);
  }

  EnumSourceField build() {
    return new _$EnumSourceField._(
        name: name,
        type: type,
        generatedIdentifier: generatedIdentifier,
        isConst: isConst,
        isStatic: isStatic);
  }
}
