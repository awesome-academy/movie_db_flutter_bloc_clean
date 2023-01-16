// Package imports:
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:movie_db_flutter_bloc_clean/src/domain/use_cases/get_popular_use_case.dart';
import 'package:movie_db_flutter_bloc_clean/src/domain/use_cases/get_top_rated_use_case.dart';
import 'package:movie_db_flutter_bloc_clean/src/domain/use_cases/get_upcoming_use_case.dart';
import 'package:movie_db_flutter_bloc_clean/src/domain/use_cases/home_use_cases/add_favorite_home_use_case.dart';
import 'package:movie_db_flutter_bloc_clean/src/domain/use_cases/home_use_cases/check_favorite_home_use_case.dart';
import 'package:movie_db_flutter_bloc_clean/src/domain/use_cases/home_use_cases/remove_favorite_home_use_case.dart';

class MockGetPopularUseCase extends Mock implements GetPopularUseCase {}

class MockGetUpcomingUseCase extends Mock implements GetUpcomingUseCase {}

class MockGetTopRatedUseCase extends Mock implements GetTopRatedUseCase {}

class MockCheckFavoriteHomeUseCase extends Mock
    implements CheckFavoriteHomeUseCase {}

class MockRemoveFavoriteHomeUseCase extends Mock
    implements RemoveFavoriteHomeUseCase {}

class MockAddFavoriteHomeUseCase extends Mock
    implements AddFavoriteHomeUseCase {}
