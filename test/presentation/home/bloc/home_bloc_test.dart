// Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:movie_db_flutter_bloc_clean/src/injectable.dart';
import 'package:movie_db_flutter_bloc_clean/src/presentation/home/bloc/home_bloc.dart';
import '../../../domain/use_cases/mock_home_repository.dart';

Future<void> main() async {
  late HomeBloc homeBloc;
  late MockGetUpcomingUseCase mockGetUpcomingUseCase;
  late MockGetTopRatedUseCase mockGetTopRatedUseCase;
  late MockGetPopularUseCase mockGetPopularUseCase;
  late MockCheckFavoriteHomeUseCase mockCheckFavoriteHomeUseCase;
  late MockRemoveFavoriteHomeUseCase mockRemoveFavoriteHomeUseCase;
  late MockAddFavoriteHomeUseCase mockAddFavoriteHomeUseCase;
  setUpAll(() async {
    configureDependencies();
    mockGetUpcomingUseCase = MockGetUpcomingUseCase();
    mockGetTopRatedUseCase = MockGetTopRatedUseCase();
    mockGetPopularUseCase = MockGetPopularUseCase();
    mockCheckFavoriteHomeUseCase = MockCheckFavoriteHomeUseCase();
    mockRemoveFavoriteHomeUseCase = MockRemoveFavoriteHomeUseCase();
    mockAddFavoriteHomeUseCase = MockAddFavoriteHomeUseCase();
    homeBloc = HomeBloc(
      mockGetUpcomingUseCase,
      mockGetTopRatedUseCase,
      mockGetPopularUseCase,
      mockCheckFavoriteHomeUseCase,
      mockRemoveFavoriteHomeUseCase,
      mockAddFavoriteHomeUseCase,
    );
    await getIt.unregister<HomeBloc>();
    getIt.registerFactory<HomeBloc>(() => homeBloc);
  });

  group('HomeBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          homeBloc,
          isNotNull,
        );
      });
    });

    test('initial state has value params', () {
      final updateBloc = homeBloc..add(HomeStarted());
      expect(updateBloc.state, equals(const HomeState()));
    });

    blocTest<HomeBloc, HomeState>(
      'HomeStarted emits',
      build: () => homeBloc,
      act: (final bloc) => bloc.add(HomeStarted()),
      expect: () => <HomeState>[],
    );
  });
}
