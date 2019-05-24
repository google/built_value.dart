// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value_generator.source_library;

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value_generator/src/library_elements.dart';
import 'package:built_value_generator/src/serializer_source_class.dart';
import 'package:quiver/iterables.dart';
import 'package:source_gen/source_gen.dart';

part 'serializer_source_library.g.dart';

abstract class SerializerSourceLibrary
    implements Built<SerializerSourceLibrary, SerializerSourceLibraryBuilder> {
  LibraryElement get element;

  factory SerializerSourceLibrary(LibraryElement element) =>
      _$SerializerSourceLibrary._(element: element);
  SerializerSourceLibrary._();

  @memoized
  ParsedLibraryResult get parsedLibrary =>
      element.library.session.getParsedLibraryByElement(element.library);

  @memoized
  bool get hasSerializers => serializersForAnnotations.isNotEmpty;

  /// Returns a map of `Serializers` declarations; the keys are field names
  /// and the values are the `@SerializersFor` annotations.
  @memoized
  BuiltMap<String, ElementAnnotation> get serializersForAnnotations {
    var result = MapBuilder<String, ElementAnnotation>();
    var accessors = element.definingCompilationUnit.accessors
        .where((element) =>
            element.isGetter && element.returnType.displayName == 'Serializers')
        .toList();

    for (var accessor in accessors) {
      final annotations = accessor.variable.metadata
          .where((annotation) =>
              annotation.computeConstantValue()?.type?.displayName ==
              'SerializersFor')
          .toList();
      if (annotations.isEmpty) continue;

      result[accessor.name] = annotations.single;
    }

    return result.build();
  }

  /// Returns the set of serializable classes in this library. A serializer
  /// needs to be installed for each of these. A serialized needs to be
  /// generated for each, except where the serializer is marked `custom`.
  @memoized
  BuiltSet<SerializerSourceClass> get sourceClasses {
    var result = SetBuilder<SerializerSourceClass>();
    var classElements = LibraryElements.getClassElements(element);
    for (var classElement in classElements) {
      final sourceClass = SerializerSourceClass(classElement);
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
      final serializersForAnnotation = serializersForAnnotations[field];

      final types = serializersForAnnotation
          .computeConstantValue()
          .getField('types')
          .toListValue()
          ?.map((dartObject) => dartObject.toTypeValue());

      if (types == null) {
        // This only happens if the source code is invalid.
        throw InvalidGenerationSourceError(
            'Broken @SerializersFor annotation. Are all the types imported?');
      }

      result.addValues(
          field,
          types.map(
              (type) => SerializerSourceClass(type.element as ClassElement)));
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
          serializeForClasses[field].where(
              (serializerSourceClass) => serializerSourceClass.isSerializable));
      BuiltSet<SerializerSourceClass> expandedResult;

      while (currentResult != expandedResult) {
        currentResult = expandedResult ?? currentResult;
        expandedResult = currentResult.rebuild((b) => b
          ..addAll(currentResult.expand((sourceClass) => sourceClass
              .fieldClasses
              .where((fieldClass) => fieldClass.isSerializable))));
      }

      result.addValues(field, currentResult);
    }

    return result.build();
  }

  bool get needsBuiltJson => sourceClasses.isNotEmpty;

  /// Generates serializer source for this library.
  String generateCode() {
    var errors = concat(sourceClasses
        .map((sourceClass) => sourceClass.computeErrors())
        .toList());

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
      .map((field) =>
          'Serializers _\$$field = (new Serializers().toBuilder()' +
          (serializeForTransitiveClasses[field]
                  .map((sourceClass) =>
                      sourceClass.generateTransitiveSerializerAdder())
                  .toList()
                    ..sort())
              .join('\n') +
          (serializeForTransitiveClasses[field]
                  .map((sourceClass) =>
                      sourceClass.generateBuilderFactoryAdders(
                          element.definingCompilationUnit))
                  .toList()
                    ..sort())
              .join('\n') +
          ').build();')
      .join('\n');
}

InvalidGenerationSourceError _makeError(Iterable<String> todos) {
  var message = StringBuffer(
      'Please make the following changes to use built_value serialization:\n');
  for (var i = 0; i != todos.length; ++i) {
    message.write('\n${i + 1}. ${todos.elementAt(i)}');
  }

  return InvalidGenerationSourceError(message.toString());
}
