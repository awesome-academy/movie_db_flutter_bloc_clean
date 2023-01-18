// Dart imports:
import 'dart:io';

// Package imports:
import 'package:retrofit/dio.dart';

// Project imports:
import '/src/core/error/api_error.dart';
import '/src/core/request/home_request/get_home_request.dart';
import '/src/core/resource/data_source.dart';
import '/src/data/datasources/local/app_cache.dart';
import '/src/data/datasources/remote/the_movie_db_service.dart';
import '/src/domain/entities/home_response/get_home_response_model.dart';
import '/src/domain/entities/home_response/get_movie_reponse_model.dart';
import '/src/domain/entities/home_response/movie_model.dart';
import '/src/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._theMovieDbService, this._appCache);

  final TheMovieDbService _theMovieDbService;
  final AppCache _appCache;

  @override
  Future<DataState<GetUpComingResponseModel?>> getUpcoming(
    GetMovieRequest params,
  ) async {
    try {
      final HttpResponse<GetUpComingResponseModel> httpResponse =
          await _theMovieDbService.getUpcoming(params);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(
          httpResponse.data,
        );
      }

      return DataFailed(
        ApiError(message: httpResponse.response.statusMessage),
      );
    } on ApiError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<GetMovieReponseModel?>> getPopular(
    GetMovieRequest params,
  ) async {
    try {
      final HttpResponse<GetMovieReponseModel> httpResponse =
          await _theMovieDbService.getPopular(params);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(
          httpResponse.data,
        );
      }

      return DataFailed(
        ApiError(message: httpResponse.response.statusMessage),
      );
    } on ApiError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<GetMovieReponseModel?>> getTopRated(
    GetMovieRequest params,
  ) async {
    try {
      final HttpResponse<GetMovieReponseModel> httpResponse =
          await _theMovieDbService.getTopRated(params);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(
          httpResponse.data,
        );
      }

      return DataFailed(
        ApiError(message: httpResponse.response.statusMessage),
      );
    } on ApiError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<bool> checkFavoriteHome(
    MovieModel params,
  ) {
    // TODO: checkFavoriteHome
    throw UnimplementedError();
  }

  @override
  Future<bool> removeFavoriteHome(
    MovieModel params,
  ) {
    // TODO: removeFavoriteHome
    throw UnimplementedError();
  }

  @override
  Future<bool> addFavoriteHome(
    MovieModel params,
  ) {
    // TODO: addFavoriteHome
    throw UnimplementedError();
  }
}
