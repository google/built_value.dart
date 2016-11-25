# Built Values for Dart
[![Build Status](https://travis-ci.org/google/built_value.dart.svg?branch=master)](https://travis-ci.org/google/built_value.dart)
## Introduction

Built Values provides:

- Immutable value types;
- EnumClass, classes that behave like enums;
- JSON serialization.

Immutable collections are from [built_collection]
(https://github.com/google/built_collection.dart#built-collections-for-dart).

## Examples

For an end to end example see the [chat example]
(https://github.com/google/built_value.dart/tree/master/chat_example), which was
[demoed](https://www.youtube.com/watch?v=TMeJxWltoVo) at the Dart Summit 2016.
The [data model]
(https://github.com/google/built_value.dart/blob/master/chat_example/lib/data_model/data_model.dart),
used both client and server side, uses value types, enums and serialization from
built_value.

Simple examples are
[here](https://github.com/google/built_value.dart/tree/master/example):
[value type]
(https://github.com/google/built_value.dart/blob/master/example/lib/simple_value.dart)
and [usage]
(https://github.com/google/built_value.dart/blob/master/example/test/simple_value_test.dart),
[enum class]
(https://github.com/google/built_value.dart/blob/master/example/lib/test_enum.dart),
[serialization]
(https://github.com/google/built_value.dart/blob/master/example/test/collections_serializer_test.dart).

Codegen is triggered via either a
[build.dart]
(https://github.com/google/built_value.dart/blob/master/example/tool/build.dart)
to do a one-off build or a
[watch.dart]
(https://github.com/google/built_value.dart/blob/master/example/tool/watch.dart)
to continuously watch your source and update generated output.

## Value Types

Value types are, for our purposes, classes that are considered
interchangeable if their fields have the same values.

Common examples include `Date`, `Money` and `Url`. Most code introduces
its own value types. For example, every web app probably has some
version of `Account` and `User`.

Value types are very commonly sent by RPC and/or stored for later
retrieval.

The problems that led to the creation of the Built Value library have
been [discussed at great length]
(https://docs.google.com/presentation/d/14u_h-lMn7f1rXE1nDiLX0azS3IkgjGl5uxp5jGJ75RE/edit)
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

- Constants have `name` and `toString`, can be used in `switch` statements,
  and are real classes that can hold code and implement interfaces
- Generated `values` method that returns all the enum values in a `BuiltSet` (immutable set)
- Generated `valueOf` method that takes a `String`

## Serialization

Built Values comes with JSON serialization support which allows you to
serialize a complete data model of Built Values, Enum Classes and
Built Collections. The [chat example]
(https://github.com/google/built_value.dart/tree/master/chat_example) shows 
how easy this makes building a full application with Dart on the server and
client.

Here are the major features of the serialization support:

It _fully supports object oriented design_: any object model that you can 
design can be serialized, including full use of generics and interfaces.
Some other libraries require concrete types or do not fully support generics.

It _allows different object oriented models over the same data_. For
example, in a client server application, it's likely that the client and server
want different functionality from their data model. So, they are allowed to have
different classes that map to the same data. Most other libraries enforce a 1:1
mapping between classes and types on the wire.

It _requires well behaved types_. They must be immutable, can use
interface but not concrete inheritance, must have predictable nullability,
`hashCode`, `equals` and `toString`. In fact, they must be Enum Classes, Built
Collections or Built Values. Some other libraries allow badly behaved types to
be serialized.

It _supports changes to the data model_. Optional fields can be added or
removed, and fields can be switched from optional to required, allowing your
data model to evolve without breaking compatbility. Some other libraries break
compatability on any change to any serializable class.

It's _modular_. Each endpoint can choose which classes to know about;
for example, you can have multiple clients that each know about only a subset of
the classes the server knows. Most other libraries are monolithic, requiring all
endpoints to know all types.

It's _multi language_. Support will be come first for Dart, Java and
Java/GWT. Many other libraries support a single language only.

It _has first class support for validation_ via Built Values. An important 
part of a powerful data model is ensuring it's valid, so classes can make
guarantees about what they can do. Other libraries also support validation
but usually in a less prominent way.

It's _pluggable_. Arbitrary extensions can be added to give 
custom JSON serialization for your own types. This could be used to
interoperate with other tools or to add hand coded high performance serializers
for specific classes. Some other libraries are not so extensible.

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/google/built_value.dart/issues
