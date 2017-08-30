# Tuple data structure

- [Tuple2], [Tuple3], [Tuple4], [Tuple5], [Tuple6], [Tuple7]

[![Build Status](https://travis-ci.org/kseo/tuple.svg)](https://travis-ci.org/kseo/tuple)
[![Coverage Status](https://coveralls.io/repos/kseo/tuple/badge.svg?branch=master&service=github)](https://coveralls.io/github/kseo/tuple?branch=master)

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
