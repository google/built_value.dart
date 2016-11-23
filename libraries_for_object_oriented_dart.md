# Libraries for Object Oriented Dart

## Introduction

Dart is a modern object oriented language; it's powerful and expressive. But,
there are a few areas where implementing a good object oriented design is harder
than it needs to be.


## Overview

Libraries for Object Oriented Dart contains two powerful libraries that help
translate object oriented designs into implementations with minimum overhead,
freeing developers to focus on the task at hand.
 
* [built_collection.dart](https://github.com/google/built_collection.dart#built-collections-for-dart)
  provides immutable, type safe collections.
  
* [built_value.dart](https://github.com/google/built_value.dart#built-values-for-dart)
  provides immutable "value types", classes with enum features and
  serialization.

For those familiar with Java, these provide equivalent functionality to
standard Java enums,
[Immutable Collections](https://github.com/google/guava/wiki/ImmutableCollectionsExplained)
and
[AutoValues](https://github.com/google/auto/tree/master/value#autovalue).

To complete the package, we'll make the whole stack compatible with Java:

* Built JSON for Java will provide compatible serialization for Java,
  mapping Enum Classes to standard Java enums, Built Collections to
  [Immutable Collections](https://github.com/google/guava/wiki/ImmutableCollectionsExplained)
  and Built Values to [AutoValues](https://github.com/google/auto/tree/master/value#autovalue).

  
## Current Status
 
* [built_collection.dart](https://github.com/google/built_collection.dart#built-collections-for-dart)
  is stable and production ready.
  
* [built_value.dart](https://github.com/google/built_value.dart#built-values-for-dart)
  is ready for use but may be missing features.
  
* Built JSON for Java is not yet started.


## Origins

The team at Google behind AdWords for video, part of the
[AdWords UI](adwords.google.com), was an early user of the Dart language.
During that work the team built tools that provided much of the same
functionality as the Libraries for Object Oriented Dart and used them as the
basis for a substantial rewrite of their corner of AdWords.

Libraries for Object Oriented Dart consists of rewrites of these tools suitable
for open sourcing. So, the ideas are well proven, but the code is at various
states of readiness.

If a library is marked "production ready" above that means it has replaced its
Google-internal equivalent and is therefore well used.
