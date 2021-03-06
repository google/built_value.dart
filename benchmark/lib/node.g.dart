// GENERATED CODE - DO NOT MODIFY BY HAND

part of node;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers =
    (new Serializers().toBuilder()..add(Node.serializer)).build();
Serializer<Node> _$nodeSerializer = new _$NodeSerializer();

class _$NodeSerializer implements StructuredSerializer<Node> {
  @override
  final Iterable<Type> types = const [Node, _$Node];
  @override
  final String wireName = 'Node';

  @override
  Iterable<Object> serialize(Serializers serializers, Node object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object? value;
    value = object.label;
    if (value != null) {
      result
        ..add('label')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.left;
    if (value != null) {
      result
        ..add('left')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Node)));
    }
    value = object.right;
    if (value != null) {
      result
        ..add('right')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Node)));
    }
    return result;
  }

  @override
  Node deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NodeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'label':
          result.label = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'left':
          result.left.replace(serializers.deserialize(value,
              specifiedType: const FullType(Node)) as Node);
          break;
        case 'right':
          result.right.replace(serializers.deserialize(value,
              specifiedType: const FullType(Node)) as Node);
          break;
      }
    }

    return result.build();
  }
}

class _$Node extends Node {
  @override
  final String? label;
  @override
  final Node? left;
  @override
  final Node? right;

  factory _$Node([void Function(NodeBuilder)? updates]) =>
      (new NodeBuilder()..update(updates)).build();

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
  _$Node build() {
    _$Node _$result;
    try {
      _$result = _$v ??
          new _$Node._(
              label: label, left: _left?.build(), right: _right?.build());
    } catch (_) {
      late String _$failedField;
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
