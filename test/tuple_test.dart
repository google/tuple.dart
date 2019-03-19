// Copyright (c) 2015, the tuple project authors. Please see the AUTHORS
// file for details. All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

import 'package:test/test.dart';
import 'package:tuple/tuple.dart';

void main() {
  final t = Tuple2<int, bool>(1, true);

  test('items', () {
    expect(t.item1, equals(1));
    expect(t.item2, equals(true));
  });

  test('withItems', () {
    expect(t.withItem1(2), equals(Tuple2<int, bool>(2, true)));
    expect(t.withItem2(false), equals(Tuple2<int, bool>(1, false)));
  });

  test('create a tuple from a list of items', () {
    final t1 = Tuple2.fromList([1, true]);
    expect(t1.item1, equals(1));
    expect(t1.item2, equals(true));

    expect(() => Tuple2.fromList([1]), throwsA(TypeMatcher<ArgumentError>()));
    expect(() => Tuple2.fromList([1, true, 'a']),
        throwsA(TypeMatcher<ArgumentError>()));
  });

  test('equality', () {
    final otherT = Tuple2<int, bool>(1, true);
    expect(t, equals(otherT));
  });

  test('nested equality', () {
    final t1 =
        Tuple2<Tuple2<int, String>, bool>(Tuple2<int, String>(3, 'a'), false);
    final t2 =
        Tuple2<Tuple2<int, String>, bool>(Tuple2<int, String>(3, 'a'), false);
    expect(t1, equals(t2));
  });

  test('can be used as keys in maps', () {
    final map = {t: 'a'};
    final key = Tuple2<int, bool>(1, true);
    expect(map[key], equals('a'));
  });

  test('toList() should return a listing containing the items of the tuple',
      () {
    expect(t.toList(), orderedEquals([1, true]));
  });

  test('toList() should return a fixed list by default', () {
    expect(() => t.toList().add(3), throwsA(TypeMatcher<UnsupportedError>()));
  });

  test('toList(growable: true) should return a growable list', () {
    expect(t.toList(growable: true)..add('a'), orderedEquals([1, true, 'a']));
  });
}
