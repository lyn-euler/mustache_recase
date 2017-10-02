import "dart:io";

import 'package:mustache/mustache.dart';
import 'package:mustache_recase/mustache_recase.dart' as mustache_recase;

main(List<String> args) {
  stdout.write("Provide a test string: ");
  String testVar = stdin.readLineSync();

  String templateSource = '';
  //@generationAfter("new-case_example_template")
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
