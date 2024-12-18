// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Node extends Node {
  @override
  final String? label;
  @override
  final Node? left;
  @override
  final Node? right;

  factory _$Node([void Function(NodeBuilder)? updates]) =>
      (new NodeBuilder()..update(updates))._build();

  _$Node._({this.label, this.left, this.right}) : super._();

  @override
  Node rebuild(void Function(NodeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NodeBuilder toBuilder() => new NodeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Node &&
        label == other.label &&
        left == other.left &&
        right == other.right;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, label.hashCode);
    _$hash = $jc(_$hash, left.hashCode);
    _$hash = $jc(_$hash, right.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Node')
          ..add('label', label)
          ..add('left', left)
          ..add('right', right))
        .toString();
  }
}

class NodeBuilder implements Builder<Node, NodeBuilder> {
  _$Node? _$v;

  String? _label;
  String? get label => _$this._label;
  set label(String? label) => _$this._label = label;

  NodeBuilder? _left;
  NodeBuilder get left => _$this._left ??= new NodeBuilder();
  set left(NodeBuilder? left) => _$this._left = left;

  NodeBuilder? _right;
  NodeBuilder get right => _$this._right ??= new NodeBuilder();
  set right(NodeBuilder? right) => _$this._right = right;

  NodeBuilder();

  NodeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _label = $v.label;
      _left = $v.left?.toBuilder();
      _right = $v.right?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Node other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Node;
  }

  @override
  void update(void Function(NodeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Node build() => _build();

  _$Node _build() {
    _$Node _$result;
    try {
      _$result = _$v ??
          new _$Node._(
            label: label,
            left: _left?.build(),
            right: _right?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'left';
        _left?.build();
        _$failedField = 'right';
        _right?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Node', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
