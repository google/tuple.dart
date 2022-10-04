[![Dart](https://github.com/google/tuple.dart/actions/workflows/build.yaml/badge.svg)](https://github.com/google/tuple.dart/actions/workflows/build.yaml)
[![Pub](https://img.shields.io/pub/v/tuple.svg)](https://pub.dev/packages/tuple)
[![package publisher](https://img.shields.io/pub/publisher/tuple.svg)](https://pub.dev/packages/tuple/publisher)

A library providing a tuple data structure.

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
