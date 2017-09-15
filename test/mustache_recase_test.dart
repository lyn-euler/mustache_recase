// Copyright (c) 2017, Rodsevich. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:mustache_recase/mustache_recase.dart';
import 'package:test/test.dart';

void main() {
  group('Recasing', () {
    String compilado;
    String testSource;
    String testVar;

    setUp(() {
      Map vars = {"testVar": testVar};
      vars.addAll(cases);
      compilado = parseString(testSource, vars);
    });

    test('First Test', () {
      expect(awesome.isAwesome, isTrue);
    });
  });
}
