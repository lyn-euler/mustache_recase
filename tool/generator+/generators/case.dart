import 'dart:async';
import 'package:generator_plus/generator_plus.dart';

class CaseGenerator extends Generator {
  String get name => "case";
  String get description => "new case generator";

  Future execution() {

  }

  OverridingPolicy get overridePolicy => OverridingPolicy.NEVER;
  List<Dependency> get alwaysNeededDependencies => null;
  Map get startingVariables => null;
}
