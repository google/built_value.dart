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
  LibraryElement get element;

  factory SerializerSourceLibrary(LibraryElement element) =>
      new _$SerializerSourceLibrary._(element: element);
  SerializerSourceLibrary._();

  // TODO(davidmorgan): better way of checking for top level declaration.
  @memoized
  bool get hasSerializers => element.definingCompilationUnit.accessors
      .any((element) => element.displayName == 'serializers');

  @memoized
  BuiltSet<SerializerSourceClass> get sourceClasses {
    final result = new SetBuilder<SerializerSourceClass>();
    final classElements = LibraryElements.getClassElements(element);
    for (final classElement in classElements) {
      final builderClassElement =
          element.getType(element.displayName + 'Builder');
      final sourceClass =
          new SerializerSourceClass(classElement, builderClassElement);
      if (sourceClass.needsBuiltJson) {
        result.add(sourceClass);
      }
    }
    return result.build();
  }

  @memoized
  BuiltSet<SerializerSourceClass> get transitiveSourceClasses {
    final result = new SetBuilder<SerializerSourceClass>();
    final transitiveClassElements =
        LibraryElements.getTransitiveClassElements(element);
    for (final classElement in transitiveClassElements) {
      final sourceClass = new SerializerSourceClass(classElement, null);
      if (sourceClass.needsBuiltJson) {
        result.add(sourceClass);
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
                        .toList()
                          ..sort())
                    .join('\n') +
                (transitiveSourceClasses
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
