// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixes.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GeneratorError extends GeneratorError {
  @override
  final String message;
  @override
  final int offset;
  @override
  final int length;
  @override
  final String fix;

  factory _$GeneratorError([void Function(GeneratorErrorBuilder) updates]) =>
      (new GeneratorErrorBuilder()..update(updates)).build();

  _$GeneratorError._({this.message, this.offset, this.length, this.fix})
      : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('GeneratorError', 'message');
    }
  }

  @override
  GeneratorError rebuild(void Function(GeneratorErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GeneratorErrorBuilder toBuilder() =>
      new GeneratorErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GeneratorError &&
        message == other.message &&
        offset == other.offset &&
        length == other.length &&
        fix == other.fix;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, message.hashCode), offset.hashCode), length.hashCode),
        fix.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GeneratorError')
          ..add('message', message)
          ..add('offset', offset)
          ..add('length', length)
          ..add('fix', fix))
        .toString();
  }
}

class GeneratorErrorBuilder
    implements Builder<GeneratorError, GeneratorErrorBuilder> {
  _$GeneratorError _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  int _offset;
  int get offset => _$this._offset;
  set offset(int offset) => _$this._offset = offset;

  int _length;
  int get length => _$this._length;
  set length(int length) => _$this._length = length;

  String _fix;
  String get fix => _$this._fix;
  set fix(String fix) => _$this._fix = fix;

  GeneratorErrorBuilder();

  GeneratorErrorBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _offset = _$v.offset;
      _length = _$v.length;
      _fix = _$v.fix;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GeneratorError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GeneratorError;
  }

  @override
  void update(void Function(GeneratorErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GeneratorError build() {
    final _$result = _$v ??
        new _$GeneratorError._(
            message: message, offset: offset, length: length, fix: fix);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
