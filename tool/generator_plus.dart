library mustache_recase.generator_plus;

import 'package:generator_plus/generator_plus_cli.dart';
import 'package:generator_plus/generator_plus.dart';
import 'package:mustache_recase/generator+/generators.dart';
import 'package:mustache_recase/generator+/annotations.dart';

class MustacheRecaseGenerator extends GeneratorPlus {
  MustacheRecaseGenerator() {
    @generationAssignment("new-generator", append: true)
    List<Generator> generators = [
      new AnnotationsGenerator(),
      new GeneratorsGenerator(),
    ];
    addGenerators(generators);
  }
}

main(args) => generatorPlusCli(new MustacheRecaseGenerator(), args);
