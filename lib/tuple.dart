// Copyright (c) 2014, the tuple project authors. Please see the AUTHORS
// file for details. All rights reserved. Use of this source code is governed
// by a BSD-style license that can be found in the LICENSE file.

/// # Tuple data structure
///
/// - [Tuple2], [Tuple3]...
///
/// ## Usage example
///
/// ```dart
/// const t = const Tuple2<String, int>('a', 10);
///
/// print(t.item1); // prints 'a'
/// print(t.item2); // prints '10'
/// ```
///
/// ```dart
/// const t1 = const Tuple2<String, int>('a', 10);
/// final t2 = t1.withItem1('c');
/// // t2 is a new [Tuple2] object with item1 is 'c' and item2 is 10.
/// ```
library tuple;

import 'package:quiver_hashcode/hashcode.dart';

part 'package:tuple/src/tuple.dart';
