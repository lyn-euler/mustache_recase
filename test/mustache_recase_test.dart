// Copyright (c) 2017, Rodsevich. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:mustache_template/mustache.dart';
import 'package:mustache_recase/mustache_recase.dart';
import 'package:recase/recase.dart';
import 'package:test/test.dart';

void main() {
  group('Recasing', () {
    late String compiled;
    String testSource = '';
    //@generationAfter("new-case_source_template")
    testSource += "{{ # dot_case }}{{test_var}} {{ / dot_case }}";
    testSource += "{{ # path_case }}{{test_var}} {{ / path_case }}";
    testSource += "{{ # constant_case }}{{test_var}} {{ / constant_case }}";
    testSource += "{{ # header_case }}{{test_var}} {{ / header_case }}";
    testSource += "{{ # sentence_case }}{{test_var}} {{ / sentence_case }}";
    testSource += "{{ # title_case }}{{test_var}} {{ / title_case }}";
    testSource += "{{ # param_case }}{{test_var}} {{ / param_case }}";
    testSource += "{{ # pascal_case }}{{test_var}} {{ / pascal_case }}";
    testSource += "{{ # snake_case }}{{test_var}} {{ / snake_case }}";
    testSource += "{{ # camel_case }}{{test_var}} {{ / camel_case }}";
    String test_var = "un_test-var_MUY_muyMuyLARGO";
    Template template = new Template(testSource);
    ReCase reCase = new ReCase(test_var);

    setUp(() {
      Map vars = {"test_var": test_var};
      vars.addAll(cases);
      compiled = template.renderString(vars);
    });

    // @generationAfter("new-case_test")
    test("Dot Case", () {
      expect(compiled, contains(reCase.dotCase));
    });

    test("Path Case", () {
      expect(compiled, contains(reCase.pathCase));
    });

    test("Constant Case", () {
      expect(compiled, contains(reCase.constantCase));
    });

    test("Header Case", () {
      expect(compiled, contains(reCase.headerCase));
    });

    test("Sentence Case", () {
      expect(compiled, contains(reCase.sentenceCase));
    });

    test("Title Case", () {
      expect(compiled, contains(reCase.titleCase));
    });

    test("Param Case", () {
      expect(compiled, contains(reCase.paramCase));
    });

    test("Pascal Case", () {
      expect(compiled, contains(reCase.pascalCase));
    });

    test("Snake Case", () {
      expect(compiled, contains(reCase.snakeCase));
    });

    test("Camel Case", () {
      expect(compiled, contains(reCase.camelCase));
    });
  });
}
