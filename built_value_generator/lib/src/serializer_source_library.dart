// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_value_generator.source_library;

import 'package:analyzer/dart/element/element.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value_generator/src/library_elements.dart';
import 'package:built_value_generator/src/serializer_source_class.dart';
import 'package:meta/meta.dart';
import 'package:quiver/iterables.dart';
import 'package:source_gen/source_gen.dart';

part 'serializer_source_library.g.dart';

abstract class SerializerSourceLibrary
    implements Built<SerializerSourceLibrary, SerializerSourceLibraryBuilder> {
  bool get hasSerializers;
  BuiltSet<SerializerSourceClass> get sourceClasses;
  BuiltSet<SerializerSourceClass> get transitiveSourceClasses;

  factory SerializerSourceLibrary([updates(SerializerSourceLibraryBuilder b)]) =
      _$SerializerSourceLibrary;
  SerializerSourceLibrary._();

  static SerializerSourceLibrary fromLibraryElement(
      LibraryElement libraryElement) {
    final result = new SerializerSourceLibraryBuilder();

    // TODO(davidmorgan): better way of checking for top level declaration.
    result.hasSerializers = libraryElement.definingCompilationUnit.accessors
        .any((element) => element.displayName == 'serializers');

    final classElements = LibraryElements.getClassElements(libraryElement);
    for (final classElement in classElements) {
      final builderClassElement =
          libraryElement.getType(classElement.displayName + 'Builder');
      final sourceClass = SerializerSourceClass.fromClassElements(
          classElement, builderClassElement);
      if (sourceClass.needsBuiltJson) {
        result.sourceClasses.add(sourceClass);
      }
    }

    final transitiveClassElements =
        LibraryElements.getTransitiveClassElements(libraryElement);
    for (final classElement in transitiveClassElements) {
      final sourceClass =
          SerializerSourceClass.fromClassElements(classElement, null);
      if (sourceClass.needsBuiltJson) {
        result.transitiveSourceClasses.add(sourceClass);
      }
    }

    return result.build();
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
                (transitiveSourceClasses
                        .map((sourceClass) =>
                            sourceClass.generateTransitiveSerializerAdder())
                        .toList()..sort())
                    .join('\n') +
                (transitiveSourceClasses
                        .map((sourceClass) =>
                            sourceClass.generateBuilderFactoryAdders())
                        .toList()..sort())
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

abstract class SerializerSourceLibraryBuilder
    implements
        Builder<SerializerSourceLibrary, SerializerSourceLibraryBuilder> {
  @virtual
  bool hasSerializers = false;
  @virtual
  SetBuilder<SerializerSourceClass> sourceClasses =
      new SetBuilder<SerializerSourceClass>();
  @virtual
  SetBuilder<SerializerSourceClass> transitiveSourceClasses =
      new SetBuilder<SerializerSourceClass>();

  factory SerializerSourceLibraryBuilder() = _$SerializerSourceLibraryBuilder;
  SerializerSourceLibraryBuilder._();
}

InvalidGenerationSourceError _makeError(Iterable<String> todos) {
  final message = new StringBuffer(
      'Please make the following changes to use built_value serialization:\n');
  for (var i = 0; i != todos.length; ++i) {
    message.write('\n${i + 1}. ${todos.elementAt(i)}');
  }

  return new InvalidGenerationSourceError(message.toString());
}
