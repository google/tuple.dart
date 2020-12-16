[![ci](https://github.com/google/tuple.dart/workflows/ci/badge.svg?branch=master)](https://github.com/google/tuple.dart/actions?query=branch%3Amaster)

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
