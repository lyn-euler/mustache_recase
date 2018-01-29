# mustache_recase

A library for extending the functionality of [mustache](https://pub.dartlang.org/packages/mustache) package with [recase](https://pub.dartlang.org/packages/recase)

## Usage

```
import 'package:mustache/mustache.dart';
import 'package:mustache_recase/mustache_recase.dart' as mustache_recase;

void main(){
  Template template = new Template("{{#title_case}} {{hello}} {{/title_case}}");
  Map variables = {"hello": "hello-world"};
  variables.addAll(mustache_recase.cases);
  String output = template.renderString(variables);
  print(output); // Hello World
}
```

See (or interact with) the [example](https://github.com/Rodsevich/mustache_recase/blob/master/example/cli_interactive_example.dart) and/or the [test](https://github.com/Rodsevich/mustache_recase/blob/master/test/mustache_recase_test.dart) of the package if you have doubts

### List of usable cases
 - snake_case
 - dot.case
 - path/case
 - param-case
 - PascalCase
 - Header-Case
 - Title Case
 - camelCase
 - Sentence case
 - CONSTANT_CASE

#### misc

This package was made with [Generator+](https://github.com/Rodsevich/generator-plus) package in an effort to have it tested and, at the same time, extended in it's mustache templates related features. I'm glad it worked as expected :smiley:
