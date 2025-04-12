// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixes.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GeneratorError extends GeneratorError {
  @override
  final String message;
  @override
  final int? offset;
  @override
  final int? length;
  @override
  final String? fix;

  factory _$GeneratorError([void Function(GeneratorErrorBuilder)? updates]) =>
      (GeneratorErrorBuilder()..update(updates))._build();

  _$GeneratorError._(
      {required this.message, this.offset, this.length, this.fix})
      : super._();
  @override
  GeneratorError rebuild(void Function(GeneratorErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GeneratorErrorBuilder toBuilder() => GeneratorErrorBuilder()..replace(this);

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
    var _$hash = 0;
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, offset.hashCode);
    _$hash = $jc(_$hash, length.hashCode);
    _$hash = $jc(_$hash, fix.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GeneratorError')
          ..add('message', message)
          ..add('offset', offset)
          ..add('length', length)
          ..add('fix', fix))
        .toString();
  }
}

class GeneratorErrorBuilder
    implements Builder<GeneratorError, GeneratorErrorBuilder> {
  _$GeneratorError? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  int? _length;
  int? get length => _$this._length;
  set length(int? length) => _$this._length = length;

  String? _fix;
  String? get fix => _$this._fix;
  set fix(String? fix) => _$this._fix = fix;

  GeneratorErrorBuilder();

  GeneratorErrorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _offset = $v.offset;
      _length = $v.length;
      _fix = $v.fix;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GeneratorError other) {
    _$v = other as _$GeneratorError;
  }

  @override
  void update(void Function(GeneratorErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GeneratorError build() => _build();

  _$GeneratorError _build() {
    final _$result = _$v ??
        _$GeneratorError._(
          message: BuiltValueNullFieldError.checkNotNull(
              message, r'GeneratorError', 'message'),
          offset: offset,
          length: length,
          fix: fix,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
