// GENERATED CODE - DO NOT MODIFY BY HAND

part of node;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Node
// **************************************************************************

// ignore_for_file: annotate_overrides
class _$Node extends Node {
  @override
  final String label;
  @override
  final Node left;
  @override
  final Node right;

  factory _$Node([void updates(NodeBuilder b)]) =>
      (new NodeBuilder()..update(updates)).build();

  _$Node._({this.label, this.left, this.right}) : super._();

  @override
  Node rebuild(void updates(NodeBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  NodeBuilder toBuilder() => new NodeBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Node) return false;
    return label == other.label && left == other.left && right == other.right;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, label.hashCode), left.hashCode), right.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Node')
          ..add('label', label)
          ..add('left', left)
          ..add('right', right))
        .toString();
  }
}

class NodeBuilder implements Builder<Node, NodeBuilder> {
  _$Node _$v;

  String _label;
  String get label => _$this._label;
  set label(String label) => _$this._label = label;

  NodeBuilder _left;
  NodeBuilder get left => _$this._left ??= new NodeBuilder();
  set left(NodeBuilder left) => _$this._left = left;

  NodeBuilder _right;
  NodeBuilder get right => _$this._right ??= new NodeBuilder();
  set right(NodeBuilder right) => _$this._right = right;

  NodeBuilder();

  NodeBuilder get _$this {
    if (_$v != null) {
      _label = _$v.label;
      _left = _$v.left?.toBuilder();
      _right = _$v.right?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Node other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Node;
  }

  @override
  void update(void updates(NodeBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Node build() {
    final result = _$v ??
        new _$Node._(
            label: label, left: _left?.build(), right: _right?.build());
    replace(result);
    return result;
  }
}
