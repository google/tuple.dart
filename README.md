[![Build Status](https://travis-ci.org/dart-lang/tuple.svg)](https://travis-ci.org/dart-lang/tuple/)

## Usage example

```dart
const t = const Tuple2<String, int>('a', 10);

print(t.item1); // prints 'a'
print(t.item2); // prints '10'
```

```dart
final t1 = const Tuple2<String, int>('a', 10);
final t2 = t1.withItem1('c');
// t2 is a new [Tuple2] object with item1 is 'c' and item2 is 10.
```
