// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '/src/core/api_key.dart';
import '/src/core/error/api_error.dart';
import '/src/core/request/home_request/get_home_request.dart';
import '/src/core/resource/data_source.dart';
import '/src/domain/entities/home_response/get_movie_reponse_model.dart';
import '/src/domain/entities/home_response/movie_model.dart';
import '/src/domain/use_cases/get_top_rated_use_case.dart';
import '/src/domain/use_cases/home_use_cases/add_favorite_home_use_case.dart';
import '/src/domain/use_cases/home_use_cases/check_favorite_home_use_case.dart';
import '/src/domain/use_cases/home_use_cases/remove_favorite_home_use_case.dart';
import '/src/presentation/blocs/app_setting/app_setting_bloc.dart';
import '/src/presentation/home/bloc/home_bloc.dart';

part 'popular_event.dart';
part 'popular_state.dart';

@injectable
class PopularBloc extends Bloc<PopularEvent, PopularState> {
  PopularBloc(
    this._getTopRatedUseCase,
    this._checkFavoriteHomeUseCase,
    this._removeFavoriteHomeUseCase,
    this._addFavoriteHomeUseCase,
  ) : super(const PopularState()) {
    on<PopularStarted>(started);
    on<PopularGot>(got);
    on<PopularLoadMore>(loadMore);
  }

  @factoryMethod
  factory PopularBloc.from(
    final GetTopRatedUseCase getTopRatedUseCase,
    final CheckFavoriteHomeUseCase checkFavoriteHomeUseCase,
    final RemoveFavoriteHomeUseCase removeFavoriteHomeUseCase,
    final AddFavoriteHomeUseCase addFavoriteHomeUseCase,
  ) =>
      PopularBloc(
        getTopRatedUseCase,
        checkFavoriteHomeUseCase,
        removeFavoriteHomeUseCase,
        addFavoriteHomeUseCase,
      );

  final GetTopRatedUseCase _getTopRatedUseCase;
  final CheckFavoriteHomeUseCase _checkFavoriteHomeUseCase;
  final RemoveFavoriteHomeUseCase _removeFavoriteHomeUseCase;
  final AddFavoriteHomeUseCase _addFavoriteHomeUseCase;
  int page = 1;

  FutureOr<void> got(
    PopularGot event,
    Emitter<PopularState> emit,
  ) async {
    emit(state.copyWith(popularStatus: NetworkDataStatus.loading));

    page = 1;

    final DataState<GetMovieReponseModel?> dataState =
        await _getTopRatedUseCase.call(
      params: GetMovieRequest(
        apiKey,
        page,
        event.language == Language.vi ? 'vi-VN' : 'en-US',
      ),
    );

    if (dataState is DataSuccess && dataState.data != null) {
      int totalPages = dataState.data?.totalPages ?? 0;
      emit(state.copyWith(
        popularStatus: NetworkDataStatus.success,
        popularData: dataState.data?.results,
        hasMore: page < totalPages,
      ));
    }

    if (dataState is DataFailed) {
      emit(state.copyWith(
        popularStatus: NetworkDataStatus.failure,
        apiError: dataState.error,
      ));
    }
  }

  FutureOr<void> loadMore(
    PopularLoadMore event,
    Emitter<PopularState> emit,
  ) async {
    emit(state.copyWith(popularStatus: NetworkDataStatus.loading));
    page++;

    await Future.delayed(const Duration(milliseconds: 300));

    final DataState<GetMovieReponseModel?> dataState =
        await _getTopRatedUseCase.call(
      params: GetMovieRequest(
        apiKey,
        page,
        event.language == Language.vi ? 'vi-VN' : 'en-US',
      ),
    );

    if (dataState is DataSuccess && dataState.data != null) {
      final stateData = state.popularData ?? [];
      final getData = dataState.data?.results ?? [];
      int totalPages = dataState.data?.totalPages ?? 0;
      emit(state.copyWith(
        popularStatus: NetworkDataStatus.success,
        popularData: [...stateData, ...getData],
        hasMore: page < totalPages,
      ));
    }

    if (dataState is DataFailed) {
      emit(state.copyWith(
        popularStatus: NetworkDataStatus.failure,
        apiError: dataState.error,
      ));
    }
  }

  FutureOr<void> started(PopularStarted event, Emitter<PopularState> emit) {
    emit(state.copyWith(
      popularData: null,
      popularStatus: NetworkDataStatus.initial,
      apiError: null,
    ));
  }
}
