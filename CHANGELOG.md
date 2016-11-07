# Changelog

## 0.1.6 (not yet released)

- Add checking for correct type arguments for Built and Builder interfaces.
- Generate empty constructor with semicolon instead of {}.
- Use ArgumentError.notNull for null errors.

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
