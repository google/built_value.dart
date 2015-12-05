# Built Values for Dart

## Introduction

Built Values provides immutable "value types" for Dart and is part of
[Libraries for Object Oriented Dart](https://github.com/google/built_value.dart/blob/master/libraries_for_object_oriented_dart.md#libraries-for-object-oriented-dart).

## Motivation

The problems that led to the creation of the Built Value library have
been [discussed at great length](https://docs.google.com/presentation/d/14u_h-lMn7f1rXE1nDiLX0azS3IkgjGl5uxp5jGJ75RE/edit)
in the context of
[AutoValue](https://github.com/google/auto/tree/master/value#autovalue)
for Java.

In short: value types are useful almost everywhere but take far too much
work to define. Any time you find yourself implementing `equals`,
`hashCode` and `toString` -- or, worse, wishing someone had -- it's
likely you have a value type.

[AutoValue](https://github.com/google/auto/tree/master/value#autovalue)
solves the problem for Java with code generation, and Built Values does
the same for Dart.

## Examples

See
[this example](https://github.com/google/built_value.dart/tree/master/example)
for a full project with a `build.dart` and some example value types.

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/google/built_value.dart/issues
