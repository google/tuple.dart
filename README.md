[![Dart](https://github.com/google/tuple.dart/actions/workflows/build.yaml/badge.svg)](https://github.com/google/tuple.dart/actions/workflows/build.yaml)
[![Pub](https://img.shields.io/pub/v/tuple.svg)](https://pub.dev/packages/tuple)
[![package publisher](https://img.shields.io/pub/publisher/tuple.svg)](https://pub.dev/packages/tuple/publisher)

A library providing a tuple data structure.

## Status - complete

We consider this package to be feature complete. With Dart 3.0, users now have
the ability to use [Records](https://dart.dev/language/records):

> Records are an anonymous, immutable, aggregate type. Like other collection
  types, they let you bundle multiple objects into a single object. 

```dart
  var record = (123, true);
  print('${record.$1}: ${record.$2}');
```

By and large, Records serve the same use cases that `package:tuple` had been
used for. New users coming to this package should likely look at using Dart
Records instead. Existing uses of package:tuple will continue to work, however
we don't intend to enhance the functionality of this package; we will continue
to maintain this package from the POV of bug fixes.

## Usage example

```dart
const t = Tuple2<String, int>('a', 10);

print(t.item1); // prints 'a'
print(t.item2); // prints '10'
```

```dart
const t1 = Tuple2<String, int>('a', 10);
final t2 = t1.withItem1('c');
// t2 is a new [Tuple2] object with item1 is 'c' and item2 is 10.
```
