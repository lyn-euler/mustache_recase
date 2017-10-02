// Copyright (c) 2017, Rodsevich. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import "package:mustache/mustache.dart";
import "package:recase/recase.dart";
import "../generator+/annotations.dart";

// snake_case
// dot.case
// path/case
// param-case
// PascalCase
// Header-Case
// Title Case
// camelCase
// Sentence case
// CONSTANT_CASE

/// The bunch of case conversions functions
@generationAssignment("new-case")
Map<String, Function> cases = {"camel_case" : (LambdaContext ctx) => new ReCase(ctx.renderString()).camelCase, "snake_case" : (LambdaContext ctx) => new ReCase(ctx.renderString()).snakeCase, "pascal_case" : (LambdaContext ctx) => new ReCase(ctx.renderString()).pascalCase, "param_case" : (LambdaContext ctx) => new ReCase(ctx.renderString()).paramCase, "title_case" : (LambdaContext ctx) => new ReCase(ctx.renderString()).titleCase, "sentence_case" : (LambdaContext ctx) => new ReCase(ctx.renderString()).sentenceCase, "header_case" : (LambdaContext ctx) => new ReCase(ctx.renderString()).headerCase, "constant_case" : (LambdaContext ctx) => new ReCase(ctx.renderString()).constantCase, "path_case" : (LambdaContext ctx) => new ReCase(ctx.renderString()).pathCase, "dot_case": (LambdaContext ctx) => new ReCase(ctx.renderString()).dotCase};