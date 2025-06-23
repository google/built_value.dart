library;

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value_generator/src/dart_types.dart';
import 'package:built_value_generator/src/metadata.dart'
    show metadataToStringValue;

part 'memoized_getter.g.dart';

abstract class MemoizedGetter
    implements Built<MemoizedGetter, MemoizedGetterBuilder> {
  String get returnType;
  NullabilitySuffix get nullabilitySuffix;
  String get name;

  factory MemoizedGetter([void Function(MemoizedGetterBuilder) updates]) =
      _$MemoizedGetter;
  MemoizedGetter._();

  bool get isNullable => nullabilitySuffix == NullabilitySuffix.question;

  static Iterable<MemoizedGetter> fromClassElement(
      InterfaceElement classElement) {
    return classElement.fields
        .where((field) =>
            field.getter != null &&
            !field.getter!.isAbstract &&
            field.getter!.metadata.any(
                (metadata) => metadataToStringValue(metadata) == 'memoized'))
        .map((field) => MemoizedGetter((b) => b
          ..returnType = DartTypes.getName(field.getter!.returnType)
          ..nullabilitySuffix = field.getter!.returnType.nullabilitySuffix
          ..name = field.displayName))
        .toList();
  }
}
