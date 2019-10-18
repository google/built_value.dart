library built_value_generator.memoized_getter;

import 'package:analyzer/dart/element/element.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value_generator/src/dart_types.dart';
import 'package:built_value_generator/src/metadata.dart'
    show metadataToStringValue;

part 'memoized_getter.g.dart';

abstract class MemoizedGetter
    implements Built<MemoizedGetter, MemoizedGetterBuilder> {
  String get returnType;
  String get name;

  factory MemoizedGetter([void Function(MemoizedGetterBuilder) updates]) =
      _$MemoizedGetter;
  MemoizedGetter._();

  static Iterable<MemoizedGetter> fromClassElement(ClassElement classElement) {
    return classElement.fields
        .where((field) =>
            field.getter != null &&
            !field.getter.isAbstract &&
            field.getter.metadata.any(
                (metadata) => metadataToStringValue(metadata) == 'memoized'))
        .map((field) => MemoizedGetter((b) => b
          ..returnType = DartTypes.getName(field.getter.returnType)
          ..name = field.displayName))
        .toList();
  }
}
