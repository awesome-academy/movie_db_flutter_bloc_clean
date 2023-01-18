// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes

// Package imports:
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'package:movie_db_flutter_bloc_clean/src/data/datasources/local/app_cache.dart'
    as _i5;
import 'package:movie_db_flutter_bloc_clean/src/data/datasources/remote/the_movie_db_service.dart'
    as _i4;
import 'package:movie_db_flutter_bloc_clean/src/domain/repositories/home_repository.dart'
    as _i3;
import 'package:movie_db_flutter_bloc_clean/src/domain/use_cases/get_popular_use_case.dart'
    as _i9;
import 'package:movie_db_flutter_bloc_clean/src/domain/use_cases/get_top_rated_use_case.dart'
    as _i10;
import 'package:movie_db_flutter_bloc_clean/src/domain/use_cases/get_upcoming_use_case.dart'
    as _i11;
import 'package:movie_db_flutter_bloc_clean/src/domain/use_cases/home_use_cases/add_favorite_home_use_case.dart'
    as _i7;
import 'package:movie_db_flutter_bloc_clean/src/domain/use_cases/home_use_cases/check_favorite_home_use_case.dart'
    as _i8;
import 'package:movie_db_flutter_bloc_clean/src/domain/use_cases/home_use_cases/remove_favorite_home_use_case.dart'
    as _i6;
import 'package:movie_db_flutter_bloc_clean/src/presentation/home/bloc/home_bloc.dart'
    as _i12;
import 'package:movie_db_flutter_bloc_clean/src/presentation/popular/bloc/popular_bloc.dart'
    as _i13;
import 'package:movie_db_flutter_bloc_clean/src/presentation/upcoming/bloc/upcoming_bloc.dart'
    as _i14;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.HomeRepository>(() => _i3.HomeRepository.create(
        gh<_i4.TheMovieDbService>(),
        gh<_i5.AppCache>(),
      ));
  gh.factory<_i6.RemoveFavoriteHomeUseCase>(
      () => _i6.RemoveFavoriteHomeUseCase(gh<_i3.HomeRepository>()));
  gh.factory<_i7.AddFavoriteHomeUseCase>(
      () => _i7.AddFavoriteHomeUseCase(gh<_i3.HomeRepository>()));
  gh.factory<_i8.CheckFavoriteHomeUseCase>(
      () => _i8.CheckFavoriteHomeUseCase(gh<_i3.HomeRepository>()));
  gh.factory<_i9.GetPopularUseCase>(
      () => _i9.GetPopularUseCase(gh<_i3.HomeRepository>()));
  gh.factory<_i10.GetTopRatedUseCase>(
      () => _i10.GetTopRatedUseCase(gh<_i3.HomeRepository>()));
  gh.factory<_i11.GetUpcomingUseCase>(
      () => _i11.GetUpcomingUseCase(gh<_i3.HomeRepository>()));
  gh.factory<_i12.HomeBloc>(() => _i12.HomeBloc.from(
        gh<_i11.GetUpcomingUseCase>(),
        gh<_i10.GetTopRatedUseCase>(),
        gh<_i9.GetPopularUseCase>(),
        gh<_i8.CheckFavoriteHomeUseCase>(),
        gh<_i6.RemoveFavoriteHomeUseCase>(),
        gh<_i7.AddFavoriteHomeUseCase>(),
      ));
  gh.factory<_i13.PopularBloc>(() => _i13.PopularBloc.from(
        gh<_i10.GetTopRatedUseCase>(),
        gh<_i8.CheckFavoriteHomeUseCase>(),
        gh<_i6.RemoveFavoriteHomeUseCase>(),
        gh<_i7.AddFavoriteHomeUseCase>(),
      ));
  gh.factory<_i14.UpcomingBloc>(() => _i14.UpcomingBloc.from(
        gh<_i11.GetUpcomingUseCase>(),
        gh<_i8.CheckFavoriteHomeUseCase>(),
        gh<_i6.RemoveFavoriteHomeUseCase>(),
        gh<_i7.AddFavoriteHomeUseCase>(),
      ));
  return getIt;
}
