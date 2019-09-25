// Copyright (c) 2015, the tuple project authors. Please see the AUTHORS
// file for details. All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:test/test.dart';
import 'package:tuple/tuple.dart';

void main() {
  group(Tuple2, () {
    final t = Tuple2<int, String>(1, 'a');

    test('has the correct items', () {
      expect(t.item1, 1);
      expect(t.item2, 'a');
    });

    group('\'s fromList', () {
      test('throws when items is null', () {
        expect(() => Tuple2<int, String>.fromList(null), throwsA(anything));
      });

      test('throws when items is empty', () {
        expect(() => Tuple2<int, String>.fromList([]), throwsArgumentError);
      });

      test('throws when items has one value', () {
        expect(() => Tuple2<int, String>.fromList([1]), throwsArgumentError);
      });

      test('throws when items has three values', () {
        expect(() => Tuple2<int, String>.fromList([1, 'a', 3]),
            throwsArgumentError);
      });

      test('throws when first value is not an int', () {
        expect(
            () => Tuple2<int, String>.fromList(['a', 'b']), throwsA(anything));
      });

      test('throws when second value is not a string', () {
        expect(() => Tuple2<int, String>.fromList([1, 2.0]), throwsA(anything));
      });
    });

    test('returns correct tuple from withItem1', () {
      expect(t.withItem1(2), Tuple2<int, String>(2, 'a'));
    });

    test('returns correct tuple from withItem2', () {
      expect(t.withItem2('b'), Tuple2<int, String>(1, 'b'));
    });

    group('\'s toList', () {
      test('returns fixed list by default', () {
        final list = t.toList();
        expect(list, orderedEquals([1, 'a']));
        expect(() => list.add(1), throwsA(TypeMatcher<UnsupportedError>()));
      });

      test('returns growable list when told so', () {
        expect(
            t.toList(growable: true)..add('b'), orderedEquals([1, 'a', 'b']));
      });
    });

    test('converts to proper string', () {
      expect('$t', '[1, a]');
    });

    test('does not equal null', () {
      expect(t == null, isFalse);
    });

    test('does not equal when first value is different', () {
      expect(t == t.withItem1(2), isFalse);
    });

    test('does not equal when second value is different', () {
      expect(t == t.withItem2('b'), isFalse);
    });

    test('does not equal when both values are different', () {
      expect(t == Tuple2<int, String>(2, 'b'), isFalse);
    });

    test('equals itself', () {
      expect(t == t, isTrue);
    });

    test('equals another object with same values', () {
      expect(t == Tuple2<int, String>(1, 'a'), isTrue);
    });

    test('can be used as a map key', () {
      final map = <Tuple2<int, String>, int>{};
      map[t] = 101;
      expect(map[Tuple2<int, String>(1, 'a')], 101);
    });
  });

  group(Tuple3, () {
    final t = Tuple3<int, String, int>(1, 'a', 10);

    test('has the correct items', () {
      expect(t.item1, 1);
      expect(t.item2, 'a');
      expect(t.item3, 10);
    });

    group('\'s fromList', () {
      test('throws when items is null', () {
        expect(
            () => Tuple3<int, String, int>.fromList(null), throwsA(anything));
      });

      test('throws when items is empty', () {
        expect(
            () => Tuple3<int, String, int>.fromList([]), throwsArgumentError);
      });

      test('throws when items has one value', () {
        expect(
            () => Tuple3<int, String, int>.fromList([1]), throwsArgumentError);
      });

      test('throws when items has two values', () {
        expect(() => Tuple3<int, String, int>.fromList([1, 'a']),
            throwsArgumentError);
      });

      test('throws when items has four values', () {
        expect(() => Tuple3<int, String, int>.fromList([1, 'a', 2, 3]),
            throwsArgumentError);
      });

      test('throws when first value is not an int', () {
        expect(() => Tuple3<int, String, int>.fromList(['', 'a', 10]),
            throwsA(anything));
      });

      test('throws when second value is not a string', () {
        expect(() => Tuple3<int, String, int>.fromList([1, 2, 10]),
            throwsA(anything));
      });

      test('throws when third value is not an int', () {
        expect(() => Tuple3<int, String, int>.fromList([1, 'a', 'b']),
            throwsA(anything));
      });
    });

    test('returns correct tuple from withItem1', () {
      expect(t.withItem1(2), Tuple3<int, String, int>(2, 'a', 10));
    });

    test('returns correct tuple from withItem2', () {
      expect(t.withItem2('b'), Tuple3<int, String, int>(1, 'b', 10));
    });

    test('returns correct tuple from withItem3', () {
      expect(t.withItem3(100), Tuple3<int, String, int>(1, 'a', 100));
    });

    group('\'s toList', () {
      test('returns fixed list by default', () {
        final list = t.toList();
        expect(list, orderedEquals([1, 'a', 10]));
        expect(() => list.add(1), throwsA(TypeMatcher<UnsupportedError>()));
      });

      test('returns growable list when told so', () {
        expect(t.toList(growable: true)..add('b'),
            orderedEquals([1, 'a', 10, 'b']));
      });
    });

    test('converts to proper string', () {
      expect('$t', '[1, a, 10]');
    });

    test('does not equal null', () {
      expect(t == null, isFalse);
    });

    test('does not equal when first value is different', () {
      expect(t == t.withItem1(2), isFalse);
    });

    test('does not equal when second value is different', () {
      expect(t == t.withItem2('b'), isFalse);
    });

    test('does not equal when third value is different', () {
      expect(t == t.withItem3(100), isFalse);
    });

    test('equals itself', () {
      expect(t == t, isTrue);
    });

    test('equals another object with same values', () {
      expect(t == Tuple3<int, String, int>(1, 'a', 10), isTrue);
    });

    test('can be used as a map key', () {
      final map = <Tuple3<int, String, int>, int>{};
      map[t] = 101;
      expect(map[Tuple3<int, String, int>(1, 'a', 10)], 101);
    });
  });

  group(Tuple4, () {
    final t = Tuple4<int, String, int, String>(1, 'a', 10, 'b');

    test('has the correct items', () {
      expect(t.item1, 1);
      expect(t.item2, 'a');
      expect(t.item3, 10);
      expect(t.item4, 'b');
    });

    group('\'s fromList', () {
      test('throws when items is null', () {
        expect(() => Tuple4<int, String, int, String>.fromList(null),
            throwsA(anything));
      });

      test('throws when items is empty', () {
        expect(() => Tuple4<int, String, int, String>.fromList([]),
            throwsArgumentError);
      });

      test('throws when items has one value', () {
        expect(() => Tuple4<int, String, int, String>.fromList([1]),
            throwsArgumentError);
      });

      test('throws when items has two values', () {
        expect(() => Tuple4<int, String, int, String>.fromList([1, 'a']),
            throwsArgumentError);
      });

      test('throws when items has three values', () {
        expect(() => Tuple4<int, String, int, String>.fromList([1, 'a', 2]),
            throwsArgumentError);
      });

      test('throws when items has five values', () {
        expect(
            () =>
                Tuple4<int, String, int, String>.fromList([1, 'a', 2, 'b', 3]),
            throwsArgumentError);
      });

      test('throws when first value is not an int', () {
        expect(
            () => Tuple4<int, String, int, String>.fromList(['', 'a', 2, 'b']),
            throwsA(anything));
      });

      test('throws when second value is not a string', () {
        expect(() => Tuple4<int, String, int, String>.fromList([1, 2, 3, 'b']),
            throwsA(anything));
      });

      test('throws when third value is not an int', () {
        expect(
            () => Tuple4<int, String, int, String>.fromList([1, 'a', 'b', 2]),
            throwsA(anything));
      });

      test('throws when fourth value is not a string', () {
        expect(() => Tuple4<int, String, int, String>.fromList([1, 'a', 2, 3]),
            throwsA(anything));
      });
    });

    test('returns correct tuple from withItem1', () {
      expect(t.withItem1(2), Tuple4<int, String, int, String>(2, 'a', 10, 'b'));
    });

    test('returns correct tuple from withItem2', () {
      expect(
          t.withItem2('b'), Tuple4<int, String, int, String>(1, 'b', 10, 'b'));
    });

    test('returns correct tuple from withItem3', () {
      expect(
          t.withItem3(100), Tuple4<int, String, int, String>(1, 'a', 100, 'b'));
    });

    test('returns correct tuple from withItem4', () {
      expect(
          t.withItem4('c'), Tuple4<int, String, int, String>(1, 'a', 10, 'c'));
    });

    group('\'s toList', () {
      test('returns fixed list by default', () {
        final list = t.toList();
        expect(list, orderedEquals([1, 'a', 10, 'b']));
        expect(() => list.add(1), throwsA(TypeMatcher<UnsupportedError>()));
      });

      test('returns growable list when told so', () {
        expect(t.toList(growable: true)..add('c'),
            orderedEquals([1, 'a', 10, 'b', 'c']));
      });
    });

    test('converts to proper string', () {
      expect('$t', '[1, a, 10, b]');
    });

    test('does not equal null', () {
      expect(t == null, isFalse);
    });

    test('does not equal when first value is different', () {
      expect(t == t.withItem1(2), isFalse);
    });

    test('does not equal when second value is different', () {
      expect(t == t.withItem2('b'), isFalse);
    });

    test('does not equal when third value is different', () {
      expect(t == t.withItem3(100), isFalse);
    });

    test('does not equal when fourth value is different', () {
      expect(t == t.withItem4('c'), isFalse);
    });

    test('equals itself', () {
      expect(t == t, isTrue);
    });

    test('equals another object with same values', () {
      expect(t == Tuple4<int, String, int, String>(1, 'a', 10, 'b'), isTrue);
    });

    test('can be used as a map key', () {
      final map = <Tuple4<int, String, int, String>, int>{};
      map[t] = 101;
      expect(map[Tuple4<int, String, int, String>(1, 'a', 10, 'b')], 101);
    });
  });

  group(Tuple5, () {
    final t = Tuple5<int, String, int, String, int>(1, 'a', 10, 'b', 100);

    test('has the correct items', () {
      expect(t.item1, 1);
      expect(t.item2, 'a');
      expect(t.item3, 10);
      expect(t.item4, 'b');
      expect(t.item5, 100);
    });

    group('\'s fromList', () {
      test('throws when items is null', () {
        expect(() => Tuple5<int, String, int, String, int>.fromList(null),
            throwsA(anything));
      });

      test('throws when items is empty', () {
        expect(() => Tuple5<int, String, int, String, int>.fromList([]),
            throwsArgumentError);
      });

      test('throws when items has one value', () {
        expect(() => Tuple5<int, String, int, String, int>.fromList([1]),
            throwsArgumentError);
      });

      test('throws when items has two values', () {
        expect(() => Tuple5<int, String, int, String, int>.fromList([1, 'a']),
            throwsArgumentError);
      });

      test('throws when items has three values', () {
        expect(
            () => Tuple5<int, String, int, String, int>.fromList([1, 'a', 2]),
            throwsArgumentError);
      });

      test('throws when items has four values', () {
        expect(
            () => Tuple5<int, String, int, String, int>.fromList(
                [1, 'a', 2, 'b']),
            throwsArgumentError);
      });

      test('throws when items has six values', () {
        expect(
            () => Tuple5<int, String, int, String, int>.fromList(
                [1, 'a', 2, 'b', 3, 'c']),
            throwsArgumentError);
      });

      test('throws when first value is not an int', () {
        expect(
            () => Tuple5<int, String, int, String, int>.fromList(
                ['z', 'a', 2, 'b', 3]),
            throwsA(anything));
      });

      test('throws when second value is not a string', () {
        expect(
            () => Tuple5<int, String, int, String, int>.fromList(
                [1, 0, 2, 'b', 3]),
            throwsA(anything));
      });

      test('throws when third value is not an int', () {
        expect(
            () => Tuple5<int, String, int, String, int>.fromList(
                [1, 'a', 'z', 'b', 3]),
            throwsA(anything));
      });

      test('throws when fourth value is not a string', () {
        expect(
            () => Tuple5<int, String, int, String, int>.fromList(
                [1, 'a', 2, 0, 3]),
            throwsA(anything));
      });

      test('throws when fifth value is not an int', () {
        expect(
            () => Tuple5<int, String, int, String, int>.fromList(
                [1, 'a', 2, 'b', 'z']),
            throwsA(anything));
      });
    });

    test('returns correct tuple from withItem1', () {
      expect(t.withItem1(2),
          Tuple5<int, String, int, String, int>(2, 'a', 10, 'b', 100));
    });

    test('returns correct tuple from withItem2', () {
      expect(t.withItem2('b'),
          Tuple5<int, String, int, String, int>(1, 'b', 10, 'b', 100));
    });

    test('returns correct tuple from withItem3', () {
      expect(t.withItem3(100),
          Tuple5<int, String, int, String, int>(1, 'a', 100, 'b', 100));
    });

    test('returns correct tuple from withItem4', () {
      expect(t.withItem4('c'),
          Tuple5<int, String, int, String, int>(1, 'a', 10, 'c', 100));
    });

    test('returns correct tuple from withItem5', () {
      expect(t.withItem5(4),
          Tuple5<int, String, int, String, int>(1, 'a', 10, 'b', 4));
    });

    group('\'s toList', () {
      test('returns fixed list by default', () {
        final list = t.toList();
        expect(list, orderedEquals([1, 'a', 10, 'b', 100]));
        expect(() => list.add(1), throwsA(TypeMatcher<UnsupportedError>()));
      });

      test('returns growable list when told so', () {
        expect(t.toList(growable: true)..add('c'),
            orderedEquals([1, 'a', 10, 'b', 100, 'c']));
      });
    });

    test('converts to proper string', () {
      expect('$t', '[1, a, 10, b, 100]');
    });

    test('does not equal null', () {
      expect(t == null, isFalse);
    });

    test('does not equal when first value is different', () {
      expect(t == t.withItem1(2), isFalse);
    });

    test('does not equal when second value is different', () {
      expect(t == t.withItem2('b'), isFalse);
    });

    test('does not equal when third value is different', () {
      expect(t == t.withItem3(100), isFalse);
    });

    test('does not equal when fourth value is different', () {
      expect(t == t.withItem4('c'), isFalse);
    });

    test('does not equal when fifth value is different', () {
      expect(t == t.withItem5(0), isFalse);
    });

    test('equals itself', () {
      expect(t == t, isTrue);
    });

    test('equals another object with same values', () {
      expect(t == Tuple5<int, String, int, String, int>(1, 'a', 10, 'b', 100),
          isTrue);
    });

    test('can be used as a map key', () {
      final map = <Tuple5<int, String, int, String, int>, int>{};
      map[t] = 101;
      expect(map[Tuple5<int, String, int, String, int>(1, 'a', 10, 'b', 100)],
          101);
    });
  });

  group(Tuple6, () {
    final t = Tuple6<int, String, int, String, int, String>(
        1, 'a', 10, 'b', 100, 'c');

    test('has the correct items', () {
      expect(t.item1, 1);
      expect(t.item2, 'a');
      expect(t.item3, 10);
      expect(t.item4, 'b');
      expect(t.item5, 100);
      expect(t.item6, 'c');
    });

    group('\'s fromList', () {
      test('throws when items is null', () {
        expect(
            () => Tuple6<int, String, int, String, int, String>.fromList(null),
            throwsA(anything));
      });

      test('throws when items is empty', () {
        expect(() => Tuple6<int, String, int, String, int, String>.fromList([]),
            throwsArgumentError);
      });

      test('throws when items has one value', () {
        expect(
            () => Tuple6<int, String, int, String, int, String>.fromList([1]),
            throwsArgumentError);
      });

      test('throws when items has two values', () {
        expect(
            () => Tuple6<int, String, int, String, int, String>.fromList(
                [1, 'a']),
            throwsArgumentError);
      });

      test('throws when items has three values', () {
        expect(
            () => Tuple6<int, String, int, String, int, String>.fromList(
                [1, 'a', 2]),
            throwsArgumentError);
      });

      test('throws when items has four values', () {
        expect(
            () => Tuple6<int, String, int, String, int, String>.fromList(
                [1, 'a', 2, 'b']),
            throwsArgumentError);
      });

      test('throws when items has five values', () {
        expect(
            () => Tuple6<int, String, int, String, int, String>.fromList(
                [1, 'a', 2, 'b', 3]),
            throwsArgumentError);
      });

      test('throws when items has seven values', () {
        expect(
            () => Tuple6<int, String, int, String, int, String>.fromList(
                [1, 'a', 2, 'b', 3, 'c', 4]),
            throwsArgumentError);
      });

      test('throws when first value is not an int', () {
        expect(
            () => Tuple6<int, String, int, String, int, String>.fromList(
                ['z', 'a', 2, 'b', 3, 'c']),
            throwsA(anything));
      });

      test('throws when second value is not a string', () {
        expect(
            () => Tuple6<int, String, int, String, int, String>.fromList(
                [1, 0, 2, 'b', 3, 'c']),
            throwsA(anything));
      });

      test('throws when third value is not an int', () {
        expect(
            () => Tuple6<int, String, int, String, int, String>.fromList(
                [1, 'a', 'z', 'b', 3, 'c']),
            throwsA(anything));
      });

      test('throws when fourth value is not a string', () {
        expect(
            () => Tuple6<int, String, int, String, int, String>.fromList(
                [1, 'a', 2, 0, 3, 'c']),
            throwsA(anything));
      });

      test('throws when fifth value is not an int', () {
        expect(
            () => Tuple6<int, String, int, String, int, String>.fromList(
                [1, 'a', 2, 'b', 'z', 'c']),
            throwsA(anything));
      });

      test('throws when sixth value is not a string', () {
        expect(
            () => Tuple6<int, String, int, String, int, String>.fromList(
                [1, 'a', 2, 'b', 3, 4]),
            throwsA(anything));
      });
    });

    test('returns correct tuple from withItem1', () {
      expect(
          t.withItem1(2),
          Tuple6<int, String, int, String, int, String>(
              2, 'a', 10, 'b', 100, 'c'));
    });

    test('returns correct tuple from withItem2', () {
      expect(
          t.withItem2('b'),
          Tuple6<int, String, int, String, int, String>(
              1, 'b', 10, 'b', 100, 'c'));
    });

    test('returns correct tuple from withItem3', () {
      expect(
          t.withItem3(100),
          Tuple6<int, String, int, String, int, String>(
              1, 'a', 100, 'b', 100, 'c'));
    });

    test('returns correct tuple from withItem4', () {
      expect(
          t.withItem4('c'),
          Tuple6<int, String, int, String, int, String>(
              1, 'a', 10, 'c', 100, 'c'));
    });

    test('returns correct tuple from withItem5', () {
      expect(
          t.withItem5(4),
          Tuple6<int, String, int, String, int, String>(
              1, 'a', 10, 'b', 4, 'c'));
    });

    test('returns correct tuple from withItem6', () {
      expect(
          t.withItem6('z'),
          Tuple6<int, String, int, String, int, String>(
              1, 'a', 10, 'b', 100, 'z'));
    });

    group('\'s toList', () {
      test('returns fixed list by default', () {
        final list = t.toList();
        expect(list, orderedEquals([1, 'a', 10, 'b', 100, 'c']));
        expect(() => list.add(1), throwsA(TypeMatcher<UnsupportedError>()));
      });

      test('returns growable list when told so', () {
        expect(t.toList(growable: true)..add(1),
            orderedEquals([1, 'a', 10, 'b', 100, 'c', 1]));
      });
    });

    test('converts to proper string', () {
      expect('$t', '[1, a, 10, b, 100, c]');
    });

    test('does not equal null', () {
      expect(t == null, isFalse);
    });

    test('does not equal when first value is different', () {
      expect(t == t.withItem1(2), isFalse);
    });

    test('does not equal when second value is different', () {
      expect(t == t.withItem2('b'), isFalse);
    });

    test('does not equal when third value is different', () {
      expect(t == t.withItem3(100), isFalse);
    });

    test('does not equal when fourth value is different', () {
      expect(t == t.withItem4('c'), isFalse);
    });

    test('does not equal when fifth value is different', () {
      expect(t == t.withItem5(0), isFalse);
    });

    test('does not equal when sixth value is different', () {
      expect(t == t.withItem6('z'), isFalse);
    });

    test('equals itself', () {
      expect(t == t, isTrue);
    });

    test('equals another object with same values', () {
      expect(
          t ==
              Tuple6<int, String, int, String, int, String>(
                  1, 'a', 10, 'b', 100, 'c'),
          isTrue);
    });

    test('can be used as a map key', () {
      final map = <Tuple6<int, String, int, String, int, String>, int>{};
      map[t] = 101;
      expect(
          map[Tuple6<int, String, int, String, int, String>(
              1, 'a', 10, 'b', 100, 'c')],
          101);
    });
  });

  group(Tuple7, () {
    final t = Tuple7<int, String, int, String, int, String, int>(
        1, 'a', 10, 'b', 100, 'c', 1000);

    test('has the correct items', () {
      expect(t.item1, 1);
      expect(t.item2, 'a');
      expect(t.item3, 10);
      expect(t.item4, 'b');
      expect(t.item5, 100);
      expect(t.item6, 'c');
      expect(t.item7, 1000);
    });

    group('\'s fromList', () {
      test('throws when items is null', () {
        expect(
            () => Tuple7<int, String, int, String, int, String, int>.fromList(
                null),
            throwsA(anything));
      });

      test('throws when items is empty', () {
        expect(
            () =>
                Tuple7<int, String, int, String, int, String, int>.fromList([]),
            throwsArgumentError);
      });

      test('throws when items has one value', () {
        expect(
            () => Tuple7<int, String, int, String, int, String, int>.fromList(
                [1]),
            throwsArgumentError);
      });

      test('throws when items has two values', () {
        expect(
            () => Tuple7<int, String, int, String, int, String, int>.fromList(
                [1, 'a']),
            throwsArgumentError);
      });

      test('throws when items has three values', () {
        expect(
            () => Tuple7<int, String, int, String, int, String, int>.fromList(
                [1, 'a', 2]),
            throwsArgumentError);
      });

      test('throws when items has four values', () {
        expect(
            () => Tuple7<int, String, int, String, int, String, int>.fromList(
                [1, 'a', 2, 'b']),
            throwsArgumentError);
      });

      test('throws when items has five values', () {
        expect(
            () => Tuple7<int, String, int, String, int, String, int>.fromList(
                [1, 'a', 2, 'b', 3]),
            throwsArgumentError);
      });

      test('throws when items has six values', () {
        expect(
            () => Tuple7<int, String, int, String, int, String, int>.fromList(
                [1, 'a', 2, 'b', 3, 'c']),
            throwsArgumentError);
      });

      test('throws when items has eight values', () {
        expect(
            () => Tuple7<int, String, int, String, int, String, int>.fromList(
                [1, 'a', 2, 'b', 3, 'c', 4, 'd']),
            throwsArgumentError);
      });

      test('throws when first value is not an int', () {
        expect(
            () => Tuple7<int, String, int, String, int, String, int>.fromList(
                ['z', 'a', 2, 'b', 3, 'c', 4]),
            throwsA(anything));
      });

      test('throws when second value is not a string', () {
        expect(
            () => Tuple7<int, String, int, String, int, String, int>.fromList(
                [1, 0, 2, 'b', 3, 'c', 4]),
            throwsA(anything));
      });

      test('throws when third value is not an int', () {
        expect(
            () => Tuple7<int, String, int, String, int, String, int>.fromList(
                [1, 'a', 'z', 'b', 3, 'c', 4]),
            throwsA(anything));
      });

      test('throws when fourth value is not a string', () {
        expect(
            () => Tuple7<int, String, int, String, int, String, int>.fromList(
                [1, 'a', 2, 0, 3, 'c', 4]),
            throwsA(anything));
      });

      test('throws when fifth value is not an int', () {
        expect(
            () => Tuple7<int, String, int, String, int, String, int>.fromList(
                [1, 'a', 2, 'b', 'z', 'c', 4]),
            throwsA(anything));
      });

      test('throws when sixth value is not a string', () {
        expect(
            () => Tuple7<int, String, int, String, int, String, int>.fromList(
                [1, 'a', 2, 'b', 3, 4, 5]),
            throwsA(anything));
      });

      test('throws when seventh value is not an int', () {
        expect(
            () => Tuple7<int, String, int, String, int, String, int>.fromList(
                [1, 'a', 2, 'b', 3, 'c', 'd']),
            throwsA(anything));
      });
    });

    test('returns correct tuple from withItem1', () {
      expect(
          t.withItem1(2),
          Tuple7<int, String, int, String, int, String, int>(
              2, 'a', 10, 'b', 100, 'c', 1000));
    });

    test('returns correct tuple from withItem2', () {
      expect(
          t.withItem2('b'),
          Tuple7<int, String, int, String, int, String, int>(
              1, 'b', 10, 'b', 100, 'c', 1000));
    });

    test('returns correct tuple from withItem3', () {
      expect(
          t.withItem3(100),
          Tuple7<int, String, int, String, int, String, int>(
              1, 'a', 100, 'b', 100, 'c', 1000));
    });

    test('returns correct tuple from withItem4', () {
      expect(
          t.withItem4('c'),
          Tuple7<int, String, int, String, int, String, int>(
              1, 'a', 10, 'c', 100, 'c', 1000));
    });

    test('returns correct tuple from withItem5', () {
      expect(
          t.withItem5(4),
          Tuple7<int, String, int, String, int, String, int>(
              1, 'a', 10, 'b', 4, 'c', 1000));
    });

    test('returns correct tuple from withItem6', () {
      expect(
          t.withItem6('z'),
          Tuple7<int, String, int, String, int, String, int>(
              1, 'a', 10, 'b', 100, 'z', 1000));
    });

    test('returns correct tuple from withItem7', () {
      expect(
          t.withItem7(0),
          Tuple7<int, String, int, String, int, String, int>(
              1, 'a', 10, 'b', 100, 'c', 0));
    });

    group('\'s toList', () {
      test('returns fixed list by default', () {
        final list = t.toList();
        expect(list, orderedEquals([1, 'a', 10, 'b', 100, 'c', 1000]));
        expect(() => list.add(1), throwsA(TypeMatcher<UnsupportedError>()));
      });

      test('returns growable list when told so', () {
        expect(t.toList(growable: true)..add(1),
            orderedEquals([1, 'a', 10, 'b', 100, 'c', 1000, 1]));
      });
    });

    test('converts to proper string', () {
      expect('$t', '[1, a, 10, b, 100, c, 1000]');
    });

    test('does not equal null', () {
      expect(t == null, isFalse);
    });

    test('does not equal when first value is different', () {
      expect(t == t.withItem1(2), isFalse);
    });

    test('does not equal when second value is different', () {
      expect(t == t.withItem2('b'), isFalse);
    });

    test('does not equal when third value is different', () {
      expect(t == t.withItem3(100), isFalse);
    });

    test('does not equal when fourth value is different', () {
      expect(t == t.withItem4('c'), isFalse);
    });

    test('does not equal when fifth value is different', () {
      expect(t == t.withItem5(0), isFalse);
    });

    test('does not equal when sixth value is different', () {
      expect(t == t.withItem6('z'), isFalse);
    });

    test('does not equal when seventh value is different', () {
      expect(t == t.withItem7(0), isFalse);
    });

    test('equals itself', () {
      expect(t == t, isTrue);
    });

    test('equals another object with same values', () {
      expect(
          t ==
              Tuple7<int, String, int, String, int, String, int>(
                  1, 'a', 10, 'b', 100, 'c', 1000),
          isTrue);
    });

    test('can be used as a map key', () {
      final map = <Tuple7<int, String, int, String, int, String, int>, int>{};
      map[t] = 101;
      expect(
          map[Tuple7<int, String, int, String, int, String, int>(
              1, 'a', 10, 'b', 100, 'c', 1000)],
          101);
    });
  });
}
