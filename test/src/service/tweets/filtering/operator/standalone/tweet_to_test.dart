// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:twitter_api_v2/src/service/tweets/filtering/operator/standalone/tweet_to.dart';

void main() {
  group('.toString', () {
    test('normal case', () {
      final actual = TweetTo('me');

      expect(actual.toString(), 'to:me');
    });

    test('when negated', () {
      final actual = TweetTo.negated('me');

      expect(actual.toString(), '-to:me');
    });

    test('when value is empty', () {
      final actual = TweetTo('');

      expect(
        () => actual.toString(),
        throwsA(
          allOf(
            isA<ArgumentError>(),
            predicate(
              (dynamic e) =>
                  e.message ==
                  'The user identifier must not be an empty string.',
            ),
          ),
        ),
      );
    });
  });
}
