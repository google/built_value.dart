// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value_generator.source_library;

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element2.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value_generator/src/parsed_library_results.dart';
import 'package:built_value_generator/src/serializer_source_class.dart';
import 'package:source_gen/source_gen.dart';

import 'dart_types.dart';

part 'serializer_source_library.g.dart';

abstract class SerializerSourceLibrary
    implements Built<SerializerSourceLibrary, SerializerSourceLibraryBuilder> {
  ParsedLibraryResults get parsedLibraryResults;
  LibraryElement2 get element;

  factory SerializerSourceLibrary(
    ParsedLibraryResults parsedLibraryResults,
    LibraryElement2 element,
  ) =>
      _$SerializerSourceLibrary._(
        parsedLibraryResults: parsedLibraryResults,
        element: element,
      );
  SerializerSourceLibrary._();

  @memoized
  ParsedLibraryResult get parsedLibrary =>
      parsedLibraryResults.parsedLibraryResultOrThrowingMock(element.library2);

  @memoized
  bool get hasSerializers => serializersForAnnotations.isNotEmpty;

  /// Returns a map of `Serializers` declarations; the keys are field names
  /// and the values are the `@SerializersFor` annotations.
  @memoized
  BuiltMap<String, ElementAnnotation> get serializersForAnnotations {
    var result = MapBuilder<String, ElementAnnotation>();
    var accessors = element.library2.topLevelVariables
        .where(
          (element) =>
              element.getter2 != null &&
              DartTypes.getName(element.getter2!.returnType) == 'Serializers',
        )
        .toList();

    for (var accessor in accessors) {
      final annotations = accessor.metadata2.annotations
          .where(
            (annotation) =>
                DartTypes.tryGetName(
                  annotation.computeConstantValue()?.type,
                ) ==
                'SerializersFor',
          )
          .toList();
      if (annotations.isEmpty) continue;

      result[accessor.name3!] = annotations.single;
    }

    return result.build();
  }

  /// Returns a list of getters annotated `SerializersFor` that have the wrong
  /// return type.
  @memoized
  BuiltList<String> get wrongSerializersDeclarations {
    var result = ListBuilder<String>();
    var accessors = element.topLevelVariables
        .where(
          (element) =>
              element.getter2 != null &&
              DartTypes.getName(element.getter2!.returnType) != 'Serializers',
        )
        .toList();

    for (var accessor in accessors) {
      final annotations = accessor.metadata2.annotations
          .where(
            (annotation) =>
                DartTypes.tryGetName(
                  annotation.computeConstantValue()?.type,
                ) ==
                'SerializersFor',
          )
          .toList();
      if (annotations.isEmpty) continue;

      result.add(accessor.name3!);
    }

    return result.build();
  }

  /// Returns the set of serializable classes in this library. A serializer
  /// needs to be installed for each of these. A serialized needs to be
  /// generated for each, except where the serializer is marked `custom`.
  @memoized
  BuiltSet<SerializerSourceClass> get sourceClasses {
    var result = SetBuilder<SerializerSourceClass>();
    var classElements = element.classes;
    for (var classElement in classElements) {
      final sourceClass = SerializerSourceClass(
        parsedLibraryResults,
        classElement,
      );
      if (sourceClass.isSerializable) {
        result.add(sourceClass);
      }
    }
    return result.build();
  }

  /// Returns a map from `Serializers` declaration field names to the classes
  /// that each serializer is required to be able to serialize.
  @memoized
  BuiltSetMultimap<String, SerializerSourceClass> get serializeForClasses {
    var result = SetMultimapBuilder<String, SerializerSourceClass>();

    for (var field in serializersForAnnotations.keys) {
      final serializersForAnnotation = serializersForAnnotations[field]!;

      final types = serializersForAnnotation
          .computeConstantValue()!
          .getField('types')!
          .toListValue()
          ?.map((dartObject) => dartObject.toTypeValue());

      if (types == null) {
        // This only happens if the source code is invalid.
        throw InvalidGenerationSourceError(
          'Broken @SerializersFor annotation. Are all the types imported?',
        );
      }

      result.addValues(
        field,
        types.map(
          (type) => SerializerSourceClass(
            parsedLibraryResults,
            type!.element3 as InterfaceElement2,
          ),
        ),
      );
    }
    return result.build();
  }

  /// Returns a map from `Serializers` declaration field names to the
  /// transitive set of serializable classes implied by `serializeForClasses`.
  @memoized
  BuiltSetMultimap<String, SerializerSourceClass>
      get serializeForTransitiveClasses {
    var result = SetMultimapBuilder<String, SerializerSourceClass>();

    for (var field in serializersForAnnotations.keys) {
      var currentResult = BuiltSet<SerializerSourceClass>(
        serializeForClasses[field]!.where(
          (serializerSourceClass) => serializerSourceClass.isSerializable,
        ),
      );
      BuiltSet<SerializerSourceClass>? expandedResult;

      while (currentResult != expandedResult) {
        currentResult = expandedResult ?? currentResult;
        expandedResult = currentResult.rebuild(
          (b) => b
            ..addAll(
              currentResult.expand(
                (sourceClass) => sourceClass.fieldClasses.where(
                  (fieldClass) => fieldClass.isSerializable,
                ),
              ),
            ),
        );
      }

      result.addValues(field, currentResult);
    }

    return result.build();
  }

  bool get needsBuiltJson => sourceClasses.isNotEmpty;

  Iterable<String> computeErrors() {
    var result = <String>[];

    if (wrongSerializersDeclarations.isNotEmpty) {
      result.add(
        'These top level getters are annotated @SerializersFor but do not '
        'have the required type Serializers, please fix the type or remove '
        'the annotation: ${wrongSerializersDeclarations.join(', ')}',
      );
    }

    return result;
  }

  /// Generates serializer source for this library.
  String generateCode() {
    var errors = [
      ...computeErrors(),
      for (var sourceClass in sourceClasses) ...sourceClass.computeErrors(),
    ];

    if (errors.isNotEmpty) throw _makeError(errors);

    return _generateSerializersTopLevelFields() +
        sourceClasses
            .where((sourceClass) => sourceClass.needsGeneratedSerializer)
            .map((sourceClass) => sourceClass.generateSerializerDeclaration())
            .join('\n') +
        sourceClasses
            .where((sourceClass) => sourceClass.needsGeneratedSerializer)
            .map((sourceClass) => sourceClass.generateSerializer())
            .join('\n');
  }

  String _generateSerializersTopLevelFields() => serializersForAnnotations.keys
      .map(
        (field) =>
            'Serializers _\$$field = (Serializers().toBuilder()' +
            (serializeForTransitiveClasses[field]!
                    .map(
                      (sourceClass) =>
                          sourceClass.generateTransitiveSerializerAdder(),
                    )
                    .toList()
                  ..sort())
                .join('\n') +
            (serializeForTransitiveClasses[field]!
                    .map(
                      (sourceClass) => sourceClass.generateBuilderFactoryAdders(
                        element.library2.firstFragment,
                      ),
                    )
                    .toList()
                  ..sort())
                .join('\n') +
            ').build();',
      )
      .join('\n');
}

InvalidGenerationSourceError _makeError(Iterable<String> todos) {
  var message = StringBuffer(
    'Please make the following changes to use built_value serialization:\n',
  );
  for (var i = 0; i != todos.length; ++i) {
    message.write('\n${i + 1}. ${todos.elementAt(i)}');
  }

  return InvalidGenerationSourceError(message.toString());
}
