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
Map<String, Function> cases = {
  "camel_case": (LambdaContext ctx) => new ReCase(ctx.renderString()).camelCase,
};
