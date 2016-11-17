# Built Values for Dart
[![Build Status](https://travis-ci.org/google/built_value.dart.svg?branch=master)](https://travis-ci.org/google/built_value.dart)
## Introduction

Built Values provides immutable "value types" and Enum Classes for Dart and 
is part of the
[Libraries for Object Oriented Dart](https://github.com/google/built_value.dart/blob/master/libraries_for_object_oriented_dart.md#libraries-for-object-oriented-dart).

## Value Types

Value types are, for our purposes, classes that are considered
interchangeable if their fields have the same values.

Common examples include `Date`, `Money` and `Url`. Most code introduces
its own value types. For example, every web app probably has some
version of `Account` and `User`.

Value types are very commonly sent by RPC and/or stored for later
retrieval.

The problems that led to the creation of the Built Value library have
been [discussed at great length](https://docs.google.com/presentation/d/14u_h-lMn7f1rXE1nDiLX0azS3IkgjGl5uxp5jGJ75RE/edit)
in the context of
[AutoValue](https://github.com/google/auto/tree/master/value#autovalue)
for Java.

In short: creating and maintaining value types by hand requires a lot of
boilerplate. It's boring to write, and if you make a mistake, you very
likely create a bug that's hard to track down.

Any solution for value types needs to allow them to participate in object
oriented design. `Date`, for example, is the right place for code that
does simple date manipulation.

[AutoValue](https://github.com/google/auto/tree/master/value#autovalue)
solves the problem for Java with code generation, and Built Values does
the same for Dart. The boilerplate is generated for you, leaving you to
specify which fields you need and to add code for the behaviour of the
class.

## Enum Class

Enum Classes provide classes with enum features.

Enums are very helpful in modelling the real world: whenever there are a
small fixed set of options, an enum is a natural choice. For an object
oriented design, though, enums need to be classes. Dart falls short here,
so Enum Classes provide what's missing!

Design:

* Constants have `name` and `toString`, can be used in `switch` statements,
  and are real classes that can hold code and implement interfaces
* Generated `values` method that returns all the enum values in a `BuiltSet` (immutable set)
* Generated `valueOf` method that takes a `String`

## Examples

See
[this example](https://github.com/google/built_value.dart/tree/master/example)
for a full project with a `build.dart`, some example value types and an enum.

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/google/built_value.dart/issues
