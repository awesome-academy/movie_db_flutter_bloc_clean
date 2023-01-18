// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '/src/core/api_key.dart';
import '/src/core/error/api_error.dart';
import '/src/core/request/home_request/get_home_request.dart';
import '/src/core/resource/data_source.dart';
import '/src/domain/entities/home_response/get_home_response_model.dart';
import '/src/domain/entities/home_response/get_movie_reponse_model.dart';
import '/src/domain/entities/home_response/movie_model.dart';
import '/src/domain/use_cases/get_popular_use_case.dart';
import '/src/domain/use_cases/get_top_rated_use_case.dart';
import '/src/domain/use_cases/get_upcoming_use_case.dart';
import '/src/domain/use_cases/home_use_cases/add_favorite_home_use_case.dart';
import '/src/domain/use_cases/home_use_cases/check_favorite_home_use_case.dart';
import '/src/domain/use_cases/home_use_cases/remove_favorite_home_use_case.dart';
import '/src/presentation/blocs/app_setting/app_setting_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._getUpcomingUseCase,
    this._getTopRatedUseCase,
    this._getPopularUseCase,
    this._checkFavoriteHomeUseCase,
    this._removeFavoriteHomeUseCase,
    this._addFavoriteHomeUseCase,
  ) : super(const HomeState()) {
    on<HomeStarted>(started);
    on<HomeGetUpcoming>(getUpcomming);
    on<HomeGetTopRated>(getTopRated);
    on<HomeGetPopular>(getPopular);
    on<HomeCheckFavorite>(checkFavorite);
    on<HomeRemoveFavorite>(removeFavorite);
    on<HomeAddFavorite>(addFavorite);
  }

  @factoryMethod
  factory HomeBloc.from(
    final GetUpcomingUseCase getUpcomingUseCase,
    final GetTopRatedUseCase getTopRatedUseCase,
    final GetPopularUseCase getPopularUseCase,
    final CheckFavoriteHomeUseCase checkFavoriteHomeUseCase,
    final RemoveFavoriteHomeUseCase removeFavoriteHomeUseCase,
    final AddFavoriteHomeUseCase addFavoriteHomeUseCase,
  ) =>
      HomeBloc(
        getUpcomingUseCase,
        getTopRatedUseCase,
        getPopularUseCase,
        checkFavoriteHomeUseCase,
        removeFavoriteHomeUseCase,
        addFavoriteHomeUseCase,
      );

  final GetUpcomingUseCase _getUpcomingUseCase;
  final GetTopRatedUseCase _getTopRatedUseCase;
  final GetPopularUseCase _getPopularUseCase;
  final CheckFavoriteHomeUseCase _checkFavoriteHomeUseCase;
  final RemoveFavoriteHomeUseCase _removeFavoriteHomeUseCase;
  final AddFavoriteHomeUseCase _addFavoriteHomeUseCase;

  Future<void> started(
    HomeStarted event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
      upcomingStatus: NetworkDataStatus.initial,
      upcomingData: null,
      topRatedStatus: NetworkDataStatus.initial,
      topRatedData: null,
      popularStatus: NetworkDataStatus.initial,
      popularData: null,
      apiError: null,
    ));
  }

  Future<void> getUpcomming(
    HomeGetUpcoming event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(upcomingStatus: NetworkDataStatus.loading));

    final DataState<GetUpComingResponseModel?> dataState =
        await _getUpcomingUseCase.call(
      params: GetMovieRequest(
          apiKey, 1, event.language == Language.vi ? 'vi-VN' : 'en-US'),
    );

    if (dataState is DataSuccess && dataState.data != null) {
      emit(state.copyWith(
        upcomingStatus: NetworkDataStatus.success,
        upcomingData: dataState.data?.results,
      ));
    }

    if (dataState is DataFailed) {
      emit(state.copyWith(
        upcomingStatus: NetworkDataStatus.failure,
        apiError: dataState.error,
      ));
    }
  }

  Future<void> getTopRated(
    HomeGetTopRated event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(topRatedStatus: NetworkDataStatus.loading));
    final DataState<GetMovieReponseModel?> dataState =
        await _getTopRatedUseCase.call(
      params: GetMovieRequest(
          apiKey, 1, event.language == Language.vi ? 'vi-VN' : 'en-US'),
    );

    if (dataState is DataSuccess && dataState.data != null) {
      emit(state.copyWith(
        topRatedStatus: NetworkDataStatus.success,
        topRatedData: dataState.data?.results,
      ));
    }

    if (dataState is DataFailed) {
      emit(state.copyWith(
        topRatedStatus: NetworkDataStatus.failure,
        apiError: dataState.error,
      ));
    }
  }

  Future<void> getPopular(
    HomeGetPopular event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(popularStatus: NetworkDataStatus.loading));
    final DataState<GetMovieReponseModel?> dataState =
        await _getPopularUseCase.call(
      params: GetMovieRequest(
          apiKey, 1, event.language == Language.vi ? 'vi-VN' : 'en-US'),
    );

    if (dataState is DataSuccess && dataState.data != null) {
      emit(state.copyWith(
        popularStatus: NetworkDataStatus.success,
        popularData: dataState.data?.results,
      ));
    }

    if (dataState is DataFailed) {
      emit(state.copyWith(
        popularStatus: NetworkDataStatus.failure,
        apiError: dataState.error,
      ));
    }
  }

  Future<void> checkFavorite(
    HomeCheckFavorite event,
    Emitter<HomeState> emit,
  ) async {
    final bool? result = await _checkFavoriteHomeUseCase.call(
      params: MovieModel(),
    );
    // TODO: Implement method
  }

  Future<void> removeFavorite(
    HomeRemoveFavorite event,
    Emitter<HomeState> emit,
  ) async {
    final bool? result = await _removeFavoriteHomeUseCase.call(
      params: MovieModel(),
    );
    // TODO: Implement method
  }

  Future<void> addFavorite(
    HomeAddFavorite event,
    Emitter<HomeState> emit,
  ) async {
    final bool? result = await _addFavoriteHomeUseCase.call(
      params: MovieModel(),
    );
    // TODO: Implement method
  }
}
