// GENERATED CODE - DO NOT MODIFY BY HAND

part of node;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

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
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Node &&
        label == other.label &&
        left == other.left &&
        right == other.right;
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
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Node;
  }

  @override
  void update(void updates(NodeBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Node build() {
    _$Node _$result;
    try {
      _$result = _$v ??
          new _$Node._(
              label: label, left: _left?.build(), right: _right?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'left';
        _left?.build();
        _$failedField = 'right';
        _right?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Node', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_as
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals
