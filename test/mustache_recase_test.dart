// Copyright (c) 2017, Rodsevich. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:mustache/mustache.dart';
import 'package:mustache_recase/mustache_recase.dart';
import 'package:recase/recase.dart';
import 'package:test/test.dart';

void main() {
  group('Recasing', () {
    String compiled;
    String testSource = '';
    //@generationAfter("new-case_source_template")
    testSource += "{{ # camel_case }} {{test_var}} {{ / camel_case }}";
    String test_var = "un_test-var_MUY_muyMuyLARGO";
    Template template = new Template(testSource);
    ReCase reCase = new ReCase(test_var);

    setUp(() {
      Map vars = {"test_var": test_var};
      vars.addAll(cases);
      compiled = template.renderString(vars);
    });

    @generationAfter("new-case_test")
    test("camelCase", () {
      expect(compiled, contains(reCase.camelCase));
    });
  });
}
