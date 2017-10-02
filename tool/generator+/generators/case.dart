import 'dart:async';
import 'package:generator_plus/generator_plus.dart';
import 'package:recase/recase.dart';

class CaseGenerator extends Generator {
  String get name => "case";
  String get description => "new case generator";

  Future execution() {
    askForInput("Provide the case name", "[a-z_A-Z]*").then((String name) {
      ReCase reCase = new ReCase(name);
      String snakeCaseName = reCase.snakeCase;
      variablesResolver["snake_case"] = snakeCaseName;
      variablesResolver["camelCase"] = reCase.camelCase;
      variablesResolver["title"] = reCase.titleCase;
      variablesResolver["escapeHack"] =
          '{{ # $snakeCaseName }}{{test_var}} {{ \/ $snakeCaseName }}';
    });
    String assignmentString =
        '"{{snake_case}}": (LambdaContext ctx) => new ReCase(ctx.renderString()).{{camelCase}}';
    String sourceTemplate = 'testSource += "{{escapeHack}}";';
    String testTemplate = '''test("{{title}}", () {
      expect(compiled, contains(reCase.{{camelCase}}));
    });
    ''';
    String exampleTemplate =
        'templateSource += "{{title}}: {{escapeHack}} \\n";';
    processFile("example/cli_interactive_example.dart",
        templates: {"new-case_example_template": exampleTemplate});
    processFile("test/mustache_recase_test.dart", templates: {
      "new-case_source_template": sourceTemplate,
      "new-case_test": testTemplate
    });
    processFile("lib/src/mustache_recase_base.dart",
        templates: {"new-case": assignmentString});
  }

  OverridingPolicy get overridePolicy => OverridingPolicy.NEVER;
  List<Dependency> get alwaysNeededDependencies => null;
  Map get startingVariables => null;
}
