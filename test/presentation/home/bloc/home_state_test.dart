// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:movie_db_flutter_bloc_clean/src/core/error/api_error.dart';
import 'package:movie_db_flutter_bloc_clean/src/presentation/home/bloc/home_bloc.dart';

// Project imports:

void main() {
  late ApiError apiError;
  late ApiError otherApiError;
  setUpAll(() {
    apiError = const ApiError(message: 'first error');
    otherApiError = const ApiError(message: 'second error');
  });
  group('homeState', () {
    test('supports value equality', () {
      expect(
        const HomeState(),
        equals(
          const HomeState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const HomeState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          final homeState =
              const HomeState().copyWith(apiError: apiError);

          expect(
            homeState,
            equals(homeState.copyWith(apiError: apiError)),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          final homeState =
              const HomeState().copyWith(apiError: apiError);
          final otherHomeState =
              const HomeState().copyWith(apiError: otherApiError);
          expect(homeState, isNot(equals(otherHomeState)));
        },
      );
    });
  });
}
