// Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:movie_db_flutter_bloc_clean/src/injectable.dart';
import 'package:movie_db_flutter_bloc_clean/src/presentation/popular/bloc/popular_bloc.dart';
import '../../../domain/use_cases/mock_home_repository.dart';

Future<void> main() async {
  late PopularBloc popularBloc;
  late MockGetTopRatedUseCase mockGetTopRatedUseCase;
  late MockCheckFavoriteHomeUseCase mockCheckFavoriteHomeUseCase;
  late MockRemoveFavoriteHomeUseCase mockRemoveFavoriteHomeUseCase;
  late MockAddFavoriteHomeUseCase mockAddFavoriteHomeUseCase;
  setUpAll(() async {
    configureDependencies();
    mockGetTopRatedUseCase = MockGetTopRatedUseCase();
    mockCheckFavoriteHomeUseCase = MockCheckFavoriteHomeUseCase();
    mockRemoveFavoriteHomeUseCase = MockRemoveFavoriteHomeUseCase();
    mockAddFavoriteHomeUseCase = MockAddFavoriteHomeUseCase();
    popularBloc = PopularBloc(
      mockGetTopRatedUseCase,
      mockCheckFavoriteHomeUseCase,
      mockRemoveFavoriteHomeUseCase,
      mockAddFavoriteHomeUseCase,
    );
    await getIt.unregister<PopularBloc>();
    getIt.registerFactory<PopularBloc>(() => popularBloc);
  });

  group('PopularBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          popularBloc,
          isNotNull,
        );
      });
    });

    test('initial state has value params', () {
      final updateBloc = popularBloc..add(PopularStarted());
      expect(updateBloc.state, equals(const PopularState()));
    });

    blocTest<PopularBloc, PopularState>(
      'PopularStarted emits',
      build: () => popularBloc,
      act: (final bloc) => bloc.add(PopularStarted()),
      expect: () => <PopularState>[],
    );
  });
}
