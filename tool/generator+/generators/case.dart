import 'dart:async';
import 'package:generator_plus/generator_plus.dart';
import 'package:recase/recase.dart';

class CaseGenerator extends Generator {
  String get name => "case";
  String get description => "new case generator";

  Future execution() {
    String snakeCaseName;
    askForInput("Provide the case name", "[a-z_A-Z]*").then((String name) {
      ReCase reCase = new ReCase(name);
      variablesResolver["snake_case"] = snakeCaseName = reCase.snakeCase;
      variablesResolver["camelCase"] = reCase.camelCase;
      variablesResolver["title"] = reCase.titleCase;
    });
    String assignmentString =
        '"{{snake_case}}": (LambdaContext ctx) => new ReCase(ctx.renderString()).{{camelCase}}';
    processFile("lib/src/mustache_recase_base.dart",
        templates: {"new-case": assignmentString});
    variablesResolver["escapeHack"] =
        '{{ # $snakeCaseName }}{{test_var}} {{ / $snakeCaseName }}';
    String sourceTemplate = 'testSource += "{{escapeHack}}";';
    String testTemplate = '''test("{{title}}", () {
      expect(compiled, contains(reCase.{{camelCase}}));
    });
    ''';
    String exampleTemplate =
        'templateSource += "{{title}}: {{escapeHack}} \n";';
    processFile("example/cli_interactive_example.dart",
        templates: {"new-case_source_template": exampleTemplate});
    processFile("test/mustache_recase_test.dart", templates: {
      "new-case_source_template": sourceTemplate,
      "new-case_test": testTemplate
    });
  }

  OverridingPolicy get overridePolicy => OverridingPolicy.NEVER;
  List<Dependency> get alwaysNeededDependencies => null;
  Map get startingVariables => null;
}
