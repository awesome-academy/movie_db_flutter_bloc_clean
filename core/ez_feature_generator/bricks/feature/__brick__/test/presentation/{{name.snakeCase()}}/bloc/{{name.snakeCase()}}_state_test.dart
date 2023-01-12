// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:{{project.snakeCase()}}/src/core/error/api_error.dart';
import 'package:{{project.snakeCase()}}/src/presentation/{{name.snakeCase()}}/bloc/{{name.snakeCase()}}_bloc.dart';

// Project imports:

void main() {
  late ApiError apiError;
  late ApiError otherApiError;
  setUpAll(() {
    apiError = const ApiError(message: 'first error');
    otherApiError = const ApiError(message: 'second error');
  });
  group('{{name.snakeCase()}}State', () {
    test('supports value equality', () {
      expect(
        const {{name.pascalCase()}}State(),
        equals(
          const {{name.pascalCase()}}State(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const {{name.pascalCase()}}State(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          final {{name.camelCase()}}State =
              const {{name.pascalCase()}}State().copyWith(apiError: apiError);

          expect(
            {{name.camelCase()}}State,
            equals({{name.camelCase()}}State.copyWith(apiError: apiError)),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          final {{name.camelCase()}}State =
              const {{name.pascalCase()}}State().copyWith(apiError: apiError);
          final other{{name.pascalCase()}}State =
              const {{name.pascalCase()}}State().copyWith(apiError: otherApiError);
          expect({{name.camelCase()}}State, isNot(equals(other{{name.pascalCase()}}State)));
        },
      );
    });
  });
}
