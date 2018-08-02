import "dart:io";

import 'package:mustache/mustache.dart';
import 'package:mustache_recase/mustache_recase.dart' as mustache_recase;

main(List<String> args) {
  stdout.write("Provide a test string: ");
  String testVar = stdin.readLineSync();

  String templateSource = '';
  //@generationAfter("new-case_example_template")
  templateSource +=
      "Dot Case: {{ # dot_case }}{{test_var}} {{ / dot_case }} \n";
  templateSource +=
      "Path Case: {{ # path_case }}{{test_var}} {{ / path_case }} \n";
  templateSource +=
      "Constant Case: {{ # constant_case }}{{test_var}} {{ / constant_case }} \n";
  templateSource +=
      "Header Case: {{ # header_case }}{{test_var}} {{ / header_case }} \n";
  templateSource +=
      "Sentence Case: {{ # sentence_case }}{{test_var}} {{ / sentence_case }} \n";
  templateSource +=
      "Title Case: {{ # title_case }}{{test_var}} {{ / title_case }} \n";
  templateSource +=
      "Param Case: {{ # param_case }}{{test_var}} {{ / param_case }} \n";
  templateSource +=
      "Pascal Case: {{ # pascal_case }}{{test_var}} {{ / pascal_case }} \n";
  templateSource +=
      "Snake Case: {{ # snake_case }}{{test_var}} {{ / snake_case }}\n";
  templateSource +=
      "Camel Case: {{ # camel_case }}{{test_var}} {{ / camel_case }}\n";

  Template template = new Template(templateSource);
  Map variables = {"test_var": testVar};
  variables.addAll(mustache_recase.cases);
  String output = template.renderString(variables);
  print(output);
}
