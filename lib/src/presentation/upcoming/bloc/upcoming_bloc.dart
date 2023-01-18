// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:movie_db_flutter_bloc_clean/src/domain/entities/home_response/get_home_response_model.dart';
import '/src/core/api_key.dart';
import '/src/core/error/api_error.dart';
import '/src/core/request/home_request/get_home_request.dart';
import '/src/core/resource/data_source.dart';
import '/src/domain/entities/home_response/movie_model.dart';
import '/src/domain/use_cases/get_upcoming_use_case.dart';
import '/src/domain/use_cases/home_use_cases/add_favorite_home_use_case.dart';
import '/src/domain/use_cases/home_use_cases/check_favorite_home_use_case.dart';
import '/src/domain/use_cases/home_use_cases/remove_favorite_home_use_case.dart';
import '/src/presentation/blocs/app_setting/app_setting_bloc.dart';
import '/src/presentation/home/bloc/home_bloc.dart';

part 'upcoming_event.dart';
part 'upcoming_state.dart';

@injectable
class UpcomingBloc extends Bloc<PopularEvent, UpcomingState> {
  UpcomingBloc(
    this._getUpcomingUseCase,
    this._checkFavoriteHomeUseCase,
    this._removeFavoriteHomeUseCase,
    this._addFavoriteHomeUseCase,
  ) : super(const UpcomingState()) {
    on<UpcomingStarted>(started);
    on<UpcomingGot>(got);
    on<UpcomingLoadMore>(loadMore);
  }

  @factoryMethod
  factory UpcomingBloc.from(
    final GetUpcomingUseCase getUpcomingUseCase,
    final CheckFavoriteHomeUseCase checkFavoriteHomeUseCase,
    final RemoveFavoriteHomeUseCase removeFavoriteHomeUseCase,
    final AddFavoriteHomeUseCase addFavoriteHomeUseCase,
  ) =>
      UpcomingBloc(
        getUpcomingUseCase,
        checkFavoriteHomeUseCase,
        removeFavoriteHomeUseCase,
        addFavoriteHomeUseCase,
      );

  final GetUpcomingUseCase _getUpcomingUseCase;
  final CheckFavoriteHomeUseCase _checkFavoriteHomeUseCase;
  final RemoveFavoriteHomeUseCase _removeFavoriteHomeUseCase;
  final AddFavoriteHomeUseCase _addFavoriteHomeUseCase;
  int page = 1;

  FutureOr<void> got(
    UpcomingGot event,
    Emitter<UpcomingState> emit,
  ) async {
    emit(state.copyWith(upcomingStatus: NetworkDataStatus.loading));

    page = 1;

    final DataState<GetUpComingResponseModel?> dataState =
        await _getUpcomingUseCase.call(
      params: GetMovieRequest(
        apiKey,
        page,
        event.language == Language.vi ? 'vi-VN' : 'en-US',
      ),
    );

    if (dataState is DataSuccess && dataState.data != null) {
      int totalPages = (dataState.data?.totalPages ?? 0).round();
      emit(state.copyWith(
        upcomingStatus: NetworkDataStatus.success,
        upcomingData: dataState.data?.results,
        hasMore: page < totalPages,
      ));
    }

    if (dataState is DataFailed) {
      emit(state.copyWith(
        upcomingStatus: NetworkDataStatus.failure,
        apiError: dataState.error,
      ));
    }
  }

  FutureOr<void> loadMore(
    UpcomingLoadMore event,
    Emitter<UpcomingState> emit,
  ) async {
    emit(state.copyWith(upcomingStatus: NetworkDataStatus.loading));
    page++;

    await Future.delayed(const Duration(milliseconds: 300));

    final DataState<GetUpComingResponseModel?> dataState =
        await _getUpcomingUseCase.call(
      params: GetMovieRequest(
        apiKey,
        page,
        event.language == Language.vi ? 'vi-VN' : 'en-US',
      ),
    );

    if (dataState is DataSuccess && dataState.data != null) {
      final stateData = state.upcomingData ?? [];
      final getData = dataState.data?.results ?? [];
      int totalPages = (dataState.data?.totalPages ?? 0).round();
      emit(state.copyWith(
        upcomingStatus: NetworkDataStatus.success,
        upcomingData: [...stateData, ...getData],
        hasMore: page < totalPages,
      ));
    }

    if (dataState is DataFailed) {
      emit(state.copyWith(
        upcomingStatus: NetworkDataStatus.failure,
        apiError: dataState.error,
      ));
    }
  }

  FutureOr<void> started(UpcomingStarted event, Emitter<UpcomingState> emit) {
    emit(state.copyWith(
      upcomingData: null,
      upcomingStatus: NetworkDataStatus.initial,
      apiError: null,
    ));
  }
}
