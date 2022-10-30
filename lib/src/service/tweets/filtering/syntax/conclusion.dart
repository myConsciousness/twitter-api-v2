// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// Project imports:
import 'filtering_rule_syntax.dart';

abstract class Conclusion implements FilteringRuleSyntax {
  /// Returns the built filtering rule.
  String build();
}
