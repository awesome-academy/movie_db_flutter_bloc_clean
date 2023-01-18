// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../entities/home_response/get_home_response_model.dart';
import '../entities/home_response/get_movie_reponse_model.dart';
import '/src/core/request/home_request/get_home_request.dart';
import '/src/core/resource/data_source.dart';
import '/src/data/datasources/local/app_cache.dart';
import '/src/data/datasources/remote/the_movie_db_service.dart';
import '/src/data/repositories/home_repository_impl.dart';
import '/src/domain/entities/home_response/movie_model.dart';

@injectable
abstract class HomeRepository {
  @factoryMethod
  static HomeRepository create(TheMovieDbService services, AppCache appcache) =>
      HomeRepositoryImpl(services, appcache);

  Future<DataState<GetUpComingResponseModel?>> getUpcoming(
    GetMovieRequest params,
  );

  Future<DataState<GetMovieReponseModel?>> getTopRated(
    GetMovieRequest params,
  );

  Future<DataState<GetMovieReponseModel?>> getPopular(
    GetMovieRequest params,
  );

  Future<bool> checkFavoriteHome(
    MovieModel params,
  );

  Future<bool> removeFavoriteHome(
    MovieModel params,
  );

  Future<bool> addFavoriteHome(
    MovieModel params,
  );
}
