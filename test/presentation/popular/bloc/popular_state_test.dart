// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:movie_db_flutter_bloc_clean/src/core/error/api_error.dart';
import 'package:movie_db_flutter_bloc_clean/src/presentation/popular/bloc/popular_bloc.dart';

void main() {
  late ApiError apiError;
  late ApiError otherApiError;
  setUpAll(() {
    apiError = const ApiError(message: 'first error');
    otherApiError = const ApiError(message: 'second error');
  });
  group('PopularState', () {
    test('supports value equality', () {
      expect(
        const PopularState(),
        equals(
          const PopularState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const PopularState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          final popularState =
              const PopularState().copyWith(apiError: apiError);

          expect(
            popularState,
            equals(popularState.copyWith(apiError: apiError)),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          final popularState =
              const PopularState().copyWith(apiError: apiError);
          final otherHomeState =
              const PopularState().copyWith(apiError: otherApiError);
          expect(popularState, isNot(equals(otherHomeState)));
        },
      );
    });
  });
}
