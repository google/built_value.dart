// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value_generator.source_library;

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
      new _$SerializerSourceLibrary._(element: element);
  SerializerSourceLibrary._();

  @memoized
  bool get hasSerializers => serializersForAnnotation != null;

  /// Returns the @serializersFor annotation from an accessor called
  /// "serializers", or null if none is found.
  @memoized
  ElementAnnotation get serializersForAnnotation {
    final accessors = element.definingCompilationUnit.accessors
        .where((element) =>
            element.isGetter && element.displayName == 'serializers')
        .toList();
    if (accessors.isEmpty) return null;
    final annotations = accessors.single.variable.metadata
        .where((annotation) =>
            annotation.computeConstantValue()?.type?.displayName ==
            'SerializersFor')
        .toList();
    if (annotations.isEmpty) return null;
    return annotations.single;
  }

  @memoized
  BuiltSet<SerializerSourceClass> get sourceClasses {
    final result = new SetBuilder<SerializerSourceClass>();
    final classElements = LibraryElements.getClassElements(element);
    for (final classElement in classElements) {
      final sourceClass = new SerializerSourceClass(classElement);
      if (sourceClass.needsBuiltJson) {
        result.add(sourceClass);
      }
    }
    return result.build();
  }

  @memoized
  BuiltSet<SerializerSourceClass> get serializeForClasses {
    final types = serializersForAnnotation
        .computeConstantValue()
        .getField('types')
        .toListValue()
        .map((dartObject) => dartObject.toTypeValue());
    return new BuiltSet<SerializerSourceClass>(types.map(
        (type) => new SerializerSourceClass(type.element as ClassElement)));
  }

  @memoized
  BuiltSet<SerializerSourceClass> get serializeForTransitiveClasses {
    var currentResult = new BuiltSet<SerializerSourceClass>(
        serializeForClasses.where(
            (serializerSourceClass) => serializerSourceClass.needsBuiltJson));
    BuiltSet<SerializerSourceClass> expandedResult;

    while (currentResult != expandedResult) {
      currentResult = expandedResult ?? currentResult;
      expandedResult = currentResult.rebuild((b) => b
        ..addAll(currentResult.expand((sourceClass) => sourceClass.fieldClasses
            .where((fieldClass) => fieldClass.needsBuiltJson))));
    }

    return currentResult;
  }

  bool get needsBuiltJson => sourceClasses.isNotEmpty;

  /// Generates serializer source for this library.
  String generateCode() {
    final errors = concat(sourceClasses
        .map((sourceClass) => sourceClass.computeErrors())
        .toList());

    if (errors.isNotEmpty) throw _makeError(errors);

    return (hasSerializers
            ? 'Serializers _\$serializers = (new Serializers().toBuilder()' +
                (serializeForTransitiveClasses
                        .map((sourceClass) =>
                            sourceClass.generateTransitiveSerializerAdder())
                        .toList()
                          ..sort())
                    .join('\n') +
                (serializeForTransitiveClasses
                        .map((sourceClass) =>
                            sourceClass.generateBuilderFactoryAdders())
                        .toList()
                          ..sort())
                    .join('\n') +
                ').build();'
            : '') +
        sourceClasses
            .map((sourceClass) => sourceClass.generateSerializerDeclaration())
            .join('\n') +
        sourceClasses
            .map((sourceClass) => sourceClass.generateSerializer())
            .join('\n');
  }
}

InvalidGenerationSourceError _makeError(Iterable<String> todos) {
  final message = new StringBuffer(
      'Please make the following changes to use built_value serialization:\n');
  for (var i = 0; i != todos.length; ++i) {
    message.write('\n${i + 1}. ${todos.elementAt(i)}');
  }

  return new InvalidGenerationSourceError(message.toString());
}
