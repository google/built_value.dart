// GENERATED CODE - DO NOT MODIFY BY HAND

part of node;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Node
// **************************************************************************

class _$Node extends Node {
  final String label;
  final Node left;
  final Node right;

  _$Node._({this.label, this.left, this.right}) : super._();

  factory _$Node([updates(NodeBuilder b)]) =>
      (new NodeBuilder()..update(updates)).build();

  Node rebuild(updates(NodeBuilder b)) =>
      (toBuilder()..update(updates)).build();

  NodeBuilder toBuilder() => new NodeBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! Node) return false;
    return label == other.label && left == other.left && right == other.right;
  }

  int get hashCode {
    return $jf($jc($jc($jc(0, label.hashCode), left.hashCode), right.hashCode));
  }

  String toString() {
    return 'Node {'
        'label=${label.toString()},\n'
        'left=${left.toString()},\n'
        'right=${right.toString()},\n'
        '}';
  }
}

class NodeBuilder implements Builder<Node, NodeBuilder> {
  Node _$v;

  String _label;
  String get label => _label;
  set label(String label) => _$writableBuilder._label = label;

  NodeBuilder _left;
  NodeBuilder get left => _$writableBuilder._left ??= new NodeBuilder();
  set left(NodeBuilder left) => _$writableBuilder._left = left;

  NodeBuilder _right;
  NodeBuilder get right => _$writableBuilder._right ??= new NodeBuilder();
  set right(NodeBuilder right) => _$writableBuilder._right = right;

  NodeBuilder();

  NodeBuilder get _$writableBuilder {
    if (_$v != null) {
      _label = _$v.label;
      _left = _$v.left?.toBuilder();
      _right = _$v.right?.toBuilder();
      _$v = null;
    }
    return this;
  }

  void replace(Node other) {
    _$v = other;
  }

  void update(updates(NodeBuilder b)) {
    if (updates != null) updates(this);
  }

  Node build() {
    final result = _$v ??
        new _$Node._(
            label: label, left: _left?.build(), right: _right?.build());
    replace(result);
    return result;
  }
}
