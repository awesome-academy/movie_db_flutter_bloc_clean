// Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:movie_db_flutter_bloc_clean/src/injectable.dart';
import 'package:movie_db_flutter_bloc_clean/src/presentation/upcoming/bloc/upcoming_bloc.dart';
import '../../../domain/use_cases/mock_home_repository.dart';

Future<void> main() async {
  late UpcomingBloc upcomingBloc;
  late MockGetUpcomingUseCase mockGetUpcomingUseCase;
  late MockCheckFavoriteHomeUseCase mockCheckFavoriteHomeUseCase;
  late MockRemoveFavoriteHomeUseCase mockRemoveFavoriteHomeUseCase;
  late MockAddFavoriteHomeUseCase mockAddFavoriteHomeUseCase;
  setUpAll(() async {
    configureDependencies();
    mockGetUpcomingUseCase = MockGetUpcomingUseCase();
    mockCheckFavoriteHomeUseCase = MockCheckFavoriteHomeUseCase();
    mockRemoveFavoriteHomeUseCase = MockRemoveFavoriteHomeUseCase();
    mockAddFavoriteHomeUseCase = MockAddFavoriteHomeUseCase();
    upcomingBloc = UpcomingBloc(
      mockGetUpcomingUseCase,
      mockCheckFavoriteHomeUseCase,
      mockRemoveFavoriteHomeUseCase,
      mockAddFavoriteHomeUseCase,
    );
    await getIt.unregister<UpcomingBloc>();
    getIt.registerFactory<UpcomingBloc>(() => upcomingBloc);
  });

  group('UpcomingBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          upcomingBloc,
          isNotNull,
        );
      });
    });

    test('initial state has value params', () {
      final updateBloc = upcomingBloc..add(UpcomingStarted());
      expect(updateBloc.state, equals(const UpcomingState()));
    });

    blocTest<UpcomingBloc, UpcomingState>(
      'UpcomingStarted emits',
      build: () => upcomingBloc,
      act: (final bloc) => bloc.add(UpcomingStarted()),
      expect: () => <UpcomingState>[],
    );
  });
}
