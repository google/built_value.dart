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

  EnumSourceFieldBuilder toBuilder() =>
      new EnumSourceFieldBuilder()..replace(this);

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

class EnumSourceFieldBuilder
    implements Builder<EnumSourceField, EnumSourceFieldBuilder> {
  EnumSourceField _$v;

  String _name;
  String get name => _name;
  set name(String name) => _$writableBuilder._name = name;

  String _type;
  String get type => _type;
  set type(String type) => _$writableBuilder._type = type;

  String _generatedIdentifier;
  String get generatedIdentifier => _generatedIdentifier;
  set generatedIdentifier(String generatedIdentifier) =>
      _$writableBuilder._generatedIdentifier = generatedIdentifier;

  bool _isConst;
  bool get isConst => _isConst;
  set isConst(bool isConst) => _$writableBuilder._isConst = isConst;

  bool _isStatic;
  bool get isStatic => _isStatic;
  set isStatic(bool isStatic) => _$writableBuilder._isStatic = isStatic;

  EnumSourceFieldBuilder();

  EnumSourceFieldBuilder get _$writableBuilder {
    if (_$v != null) {
      _name = _$v.name;
      _type = _$v.type;
      _generatedIdentifier = _$v.generatedIdentifier;
      _isConst = _$v.isConst;
      _isStatic = _$v.isStatic;
      _$v = null;
    }
    return this;
  }

  void replace(EnumSourceField other) {
    _$v = other;
  }

  void update(updates(EnumSourceFieldBuilder b)) {
    if (updates != null) updates(this);
  }

  EnumSourceField build() {
    final result = _$v ??
        new _$EnumSourceField._(
            name: name,
            type: type,
            generatedIdentifier: generatedIdentifier,
            isConst: isConst,
            isStatic: isStatic);
    replace(result);
    return result;
  }
}
