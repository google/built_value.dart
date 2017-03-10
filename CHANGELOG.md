# Changelog

## 0.5.6

- Add serializer for "DateTime" fields.
- Add JsonObject class and serializer.
- Add convenience methods Seralizers.serializeWith and deserializeWith. 
- Add example for using StandardJsonPlugin.

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
