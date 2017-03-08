// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_generator.enum_source_field;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class EnumSourceField
// **************************************************************************

class _$EnumSourceField extends EnumSourceField {
  @override
  final String name;
  @override
  final String type;
  @override
  final String generatedIdentifier;
  @override
  final String serializedAsValue;
  @override
  final bool isConst;
  @override
  final bool isStatic;

  factory _$EnumSourceField([void updates(EnumSourceFieldBuilder b)]) =>
      (new EnumSourceFieldBuilder()..update(updates)).build();

  _$EnumSourceField._(
      {this.name,
      this.type,
      this.generatedIdentifier,
      this.serializedAsValue,
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

  @override
  EnumSourceField rebuild(void updates(EnumSourceFieldBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  EnumSourceFieldBuilder toBuilder() =>
      new EnumSourceFieldBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! EnumSourceField) return false;
    return name == other.name &&
        type == other.type &&
        generatedIdentifier == other.generatedIdentifier &&
        serializedAsValue == other.serializedAsValue &&
        isConst == other.isConst &&
        isStatic == other.isStatic;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, name.hashCode), type.hashCode),
                    generatedIdentifier.hashCode),
                serializedAsValue.hashCode),
            isConst.hashCode),
        isStatic.hashCode));
  }

  @override
  String toString() {
    return 'EnumSourceField {'
        'name=${name.toString()},\n'
        'type=${type.toString()},\n'
        'generatedIdentifier=${generatedIdentifier.toString()},\n'
        'serializedAsValue=${serializedAsValue.toString()},\n'
        'isConst=${isConst.toString()},\n'
        'isStatic=${isStatic.toString()},\n'
        '}';
  }
}

class EnumSourceFieldBuilder
    implements Builder<EnumSourceField, EnumSourceFieldBuilder> {
  _$EnumSourceField _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _generatedIdentifier;
  String get generatedIdentifier => _$this._generatedIdentifier;
  set generatedIdentifier(String generatedIdentifier) =>
      _$this._generatedIdentifier = generatedIdentifier;

  String _serializedAsValue;
  String get serializedAsValue => _$this._serializedAsValue;
  set serializedAsValue(String serializedAsValue) =>
      _$this._serializedAsValue = serializedAsValue;

  bool _isConst;
  bool get isConst => _$this._isConst;
  set isConst(bool isConst) => _$this._isConst = isConst;

  bool _isStatic;
  bool get isStatic => _$this._isStatic;
  set isStatic(bool isStatic) => _$this._isStatic = isStatic;

  EnumSourceFieldBuilder();

  EnumSourceFieldBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _type = _$v.type;
      _generatedIdentifier = _$v.generatedIdentifier;
      _serializedAsValue = _$v.serializedAsValue;
      _isConst = _$v.isConst;
      _isStatic = _$v.isStatic;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EnumSourceField other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$EnumSourceField;
  }

  @override
  void update(void updates(EnumSourceFieldBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$EnumSourceField build() {
    final result = _$v ??
        new _$EnumSourceField._(
            name: name,
            type: type,
            generatedIdentifier: generatedIdentifier,
            serializedAsValue: serializedAsValue,
            isConst: isConst,
            isStatic: isStatic);
    replace(result);
    return result;
  }
}
