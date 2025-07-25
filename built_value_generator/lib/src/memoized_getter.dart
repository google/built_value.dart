library;

import 'package:analyzer/dart/element/element2.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:built_value/built_value.dart';
import 'dart_types.dart';
import 'metadata.dart' show metadataToStringValue;

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
    InterfaceElement2 classElement,
  ) {
    return classElement.fields2
        .where(
          (field) =>
              field.getter2 != null &&
              !field.getter2!.isAbstract &&
              field.getter2!.metadata2.annotations.any(
                (metadata) => metadataToStringValue(metadata) == 'memoized',
              ),
        )
        .map(
          (field) => MemoizedGetter(
            (b) => b
              ..returnType = DartTypes.getName(field.getter2!.returnType)
              ..nullabilitySuffix = field.getter2!.returnType.nullabilitySuffix
              ..name = field.displayName,
          ),
        )
        .toList();
  }
}
