// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:movie_db_flutter_bloc_clean/src/core/error/api_error.dart';
import 'package:movie_db_flutter_bloc_clean/src/presentation/upcoming/bloc/upcoming_bloc.dart';

void main() {
  late ApiError apiError;
  late ApiError otherApiError;
  setUpAll(() {
    apiError = const ApiError(message: 'first error');
    otherApiError = const ApiError(message: 'second error');
  });
  group('UpcomingState', () {
    test('supports value equality', () {
      expect(
        const UpcomingState(),
        equals(
          const UpcomingState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const UpcomingState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          final upcomingState =
              const UpcomingState().copyWith(apiError: apiError);

          expect(
            upcomingState,
            equals(upcomingState.copyWith(apiError: apiError)),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          final upcomingState =
              const UpcomingState().copyWith(apiError: apiError);
          final otherHomeState =
              const UpcomingState().copyWith(apiError: otherApiError);
          expect(upcomingState, isNot(equals(otherHomeState)));
        },
      );
    });
  });
}
