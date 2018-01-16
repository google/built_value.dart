# Changelog

## 4.6.1

- Allow hand-coded base builders, that is, builders for classes with
  `@BuiltValue(instantaible: false)`. They are now allowed to not
  implement `Builder` (as a workaround for a dart2js issue); they are
  allowed to omit fields; and they must omit constructor and factory.

## 4.6.0

- Add custom `Error` classes: `BuiltValueNullFieldError`,
  `BuiltValueMissingGenericsError` and `BuiltValueNestedFieldError`. These
  provide clearer error messages on failure. In particular, errors in nested
  builders now report the enclosing class and field name, making them much
  more useful.
- Fix serialization when using polymorphism with StandardJsonPlugin.

## 4.5.2

- Allow built_collection 3.0.0.
- Allow quiver 0.27.

## 4.5.1

- Fix generation when analyzing using summaries.

## 4.5.0

New features:

- Add `serialize` field to `@BuiltValueField`. Use this to tag fields to skip
  when serializing.
- Add `wireName` field to `@BuiltValue` and `@BuiltValueField`. Use this to
  override the wire name for classes and fields when serializing.
- Add `@BuiltValueEnum` and `@BuiltValueEnumConst` annotations for specifying
  settings for enums. Add `wireName` field to these to override the wire names
  in enums when serializing.
- Add support for polymorphism to `StandardJsonPlugin`. It will now specify
  type names as needed via a `discriminator` field, which by defualt is
  called `$`. This can be changed in the `StandardJsonPlugin` constructor.
- Add `BuiltListAsyncDeserializer`. It provides a way to deserialize large
  responses without blocking, provided the top level serialized type is
  `BuiltList`.
- Add built in serializer for `Uri`.

Improvements:

- Allow declaration of multiple `Serializers` in the same file.
- Explicitly disallow private fields; fail with an error during generation if
  one is found.
- Improve error message for field without type.

Fixes:

- Fix generated builder when fields hold function types.
- Fix checks and generated builder when manually maintained builder has
  generics.
- Fix name of classes generated from a private class.
- Fix builder and serializer generation when importing with a prefix.

## 4.4.1

- Use build 0.11.1 and build_runner 0.6.0.

## 4.4.0

- New annotation, `BuiltValueField`, for configuring fields. First
  setting available is `compare`. Set to `false` to ignore a particular field
  for `operator==` and `hashCode`.
- Generator now has a `const` constructor.

## 4.3.4

- Fix for built_collection 2.0.0.

## 4.3.3

- Allow quiver 0.26.

## 4.3.2

- Fix generation when a field is found via two levels of inheritance.

## 4.3.1

- Fix generation when a field comes from an interface but is also implemented
  by a mixin.

## 4.3.0

- Support serializing Int64.

## 4.2.1

- Correct handling of import prefixes; fixes some corner cases in
  generation.

## 4.2.0

- Generated code ignores more lints.
- Add a workaround so "polymorphism" features can be used with dart2js.
  See example/lib/polymorphism.dart.
- Deal explicitly with the user defining their own operator==, hashCode
  and/or toString(). Previously, they would just not work. Now, custom
  operator== and hashCode are forbidden at compile time, but custom
  toString() is supported.

## 4.1.1

- Generated code now tells the analyzer to ignore
  prefer_expression_function_bodies and sort_constructors_first.
- Remove an unneeded use of computeNode in generator; improves generator
  performance.

## 4.1.0

- Improved annotation handling for corner cases.
- Pick up field declarations from mixins as well as interfaces.

## 4.0.0

- Fix generated polymorphic builders for the analyzer. Mark the `rebuild`
  method with `covariant` so the analyzer knows that, for example, a
  `CatBuilder` cannot accept an `Animal`.
- Update to build 0.10.0 and build_runner 0.4.0. Please update your
  `build.dart` and `watch.dart` as shown in the examples.

## 3.0.0

- Fix DateTime serialization; include microseconds. This is a breaking change
  to the JSON format.
- Add SerializersFor annotation. Classes to serialize are no longer found by
  scanning all available libraries, as this was slow and hard to control.
  Instead, specify which classes you need to serialize using the new
  annotation on your "serializers" declaration. You only need to specify the
  "root" classes; the classes needed for the fields of classes you specify
  are included, transitively.

## 2.1.0

- Add "nestedBuilders" setting. Defaults to true; set to false to stop
  using nested builders by default in fully generated builders.
- Allow fields to be called 'result'.
- Fix generation when a field is a noninstantiable built value: don't try to
  instantiate the abstract builder.

## 2.0.0

- Update to source_gen 0.7.0.
- Please make the following trivial update to your `build.dart` and
  `watch.dart`: replace the string `GeneratorBuilder` with `PartBuilder`.

## 1.2.1

- Fix generated code when implementing generic non-instantiable Built class.

## 1.2.0

- Fix depending on a fully generated builder from a manually maintained builder.
- Pick up fields on implemented interfaces, so you don't have to @override them.
- Add BuiltValue annotation for specifying settings.
- Add "instantiable" setting. When false, no implementation is generated, only
  a builder interface.
- Polymorphism support: you can now "implement" a non-instantiable Built class.
  The generated builder will implement its builder, so the types all work.

## 1.1.4

- Require SDK 1.21 and use the non-comment syntax for generics again.

## 1.1.3

- Removed dependency on now-unneeded package:meta.
- Fixed a few lints/hints in enum generated code.
- Use comment syntax for generics; using the non-comment syntax requires
  SDK 1.21 which is not specified in pubspec.yaml.

## 1.1.2

- Significantly improve build performance by using @memoized instead of
  precomputed fields.

## 1.1.1

- Update analyzer and build dependencies.

## 1.1.0

- Add "built_value_test" library. It provides a matcher which gives good
  mismatch messages for built_value instances.

## 1.0.1

- Allow quiver 0.25.

## 1.0.0

- Version bump to 1.0.0. Three minor features are marked as experimental and 
  may change without a major version increase: BuiltValueToStringHelper,
  JsonObject and SerializerPlugin.
- Made toString() output customizable.
- Made the default toString() output use indentation and omit nulls.
- Sort serializers in generated output.

## 0.5.7

- Ignore nulls when deserializing with StandardJsonPlugin.

## 0.5.6

- Add serializer for "DateTime" fields.
- Add JsonObject class and serializer.
- Add convenience methods Seralizers.serializeWith and deserializeWith. 
- Add example for using StandardJsonPlugin.
- Support serializing NaN, INF and -INF for double and num.

## 0.5.5

- Add serializer for "num" fields.
- Better error message for missing serializer.
- Fix generation when there are nested multi-parameter generics.
- Use cascades in generated code as suggested by lint.
- Allow users to define any factory that references the generated
  implementation.
- Add example of a simpler factory for a one-field class.

## 0.5.4

- Enforce that serializer declarations refer to the right generated name.
- Streamline generation for classes with no fields.
- Add identical check to generated operator==.
- Make generated code compatible with strong mode implicit-dynamic:false
  and implicit-cast:false.

## 0.5.3

- Add null check to generated builder "replace" methods.
- Fail with error on abstract enum classes.
- Update to `build` 0.7.0 , `build_runner` 0.3.0, and `build_test` 0.4.0.

## 0.5.2

- Support "import ... as" for field types.

## 0.5.1

- Add @memoized. Annotate getters on built_value classes with @memoized
  to memoize their result. That means it's computed on first access then
  stored in the instance.
- Support generics, in value types and in serialization.
- Add support for "standard" JSON via StandardJsonPlugin.

## 0.5.0

- Update dependency on analyzer, build, quiver.
- Breaking change: your build.dart and watch.dart now need to import
  build_runner/build_runner.dart instead of build/build.dart.

## 0.4.3

- Fix builder getters to be available before a set is used.

## 0.4.2

- Fix lints.
- Allow "updates" in value type factory to have explicit void return type.

## 0.4.1

- Fix some analyzer hints.
- Fix exception from serializer generator if builder field is incorrect.

## 0.4.0

- Add benchmark for updating deeply nested data structures.
- Make builders copy lazily. This makes updates to deeply nested structures
  much faster: only the classes on the path to the update are copied, instead
  of the entire tree.
- Breaking change: if you hand-code the builder then you must mark the fields
  @virtual so they can be overriden in the generated code.
- Auto-create nested nullable builders when they're accessed. Fixes
  deserialization with nested nullable builder.

## 0.3.0

- Merged built_json and built_json_generator into built_value and
  built_value_generator. These are intended to be used together, and make
  more sense as a single package.
- Fix generation when class extends multiple interfaces.
- Add serialization of BuiltListMultimap and BuiltSetMultimap.

## 0.2.0

- Merged enum_class and enum_class_generator into built_value and
  built_value_generator. These are intended to be used together, and make
  more sense as a single package.

## 0.1.6

- Add checking for correct type arguments for Built and Builder interfaces.
- Generate empty constructor with semicolon instead of {}.
- Use ArgumentError.notNull for null errors.
- Reject dynamic fields.
- Add simple benchmark for hashing. Improve hashing performance.

## 0.1.5

- Allow quiver 0.23.

## 0.1.4

- Upgrade analyzer, build and source_gen dependencies.

## 0.1.3

- Generate builder if it's not written by hand.
- Make toString append commas for improved clarity.
- Improve examples and tests.
- Fix double null checking.

## 0.1.2

- Refactor generator to split into logical classes.

## 0.1.1

- Improve error output on failure to generate.

## 0.1.0

- Upgrade to source_gen 0.5.0.
- Breaking change; see example for required changes to build.dart.

## 0.0.6

- Move null checks to "build" method for compatibility with Strong Mode
  analyzer.
- Allow (and ignore) setters.
- Allow custom factories on value classes.

## 0.0.5

- Fix for changes to analyzer library.

## 0.0.4

- Support @nullable for fields using builders.
- Fix constraints for source_gen.

## 0.0.3

- Allow static fields in value class.
- Allow custom setters in builder.

## 0.0.2

- Fix error message for missing builder class.
- Allow non-abstract getters in value class.

## 0.0.1

- Generator, tests and example.
