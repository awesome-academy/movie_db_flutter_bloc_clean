// Package imports:
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

// Project imports:
import '/src/core/request/home_request/get_home_request.dart';
import '/src/core/utils/network/endpoint.dart';
import '/src/domain/entities/home_response/get_home_response_model.dart';
import '/src/domain/entities/home_response/get_movie_reponse_model.dart';

part 'the_movie_db_service.g.dart';

@RestApi(baseUrl: EndPoints.theMoviebUrl)
abstract class TheMovieDbService {
  factory TheMovieDbService(Dio dio, {required String baseUrl}) =
      _TheMovieDbService;

  @GET(EndPoints.upcoming)
  Future<HttpResponse<GetUpComingResponseModel>> getUpcoming(
    @Queries() final GetMovieRequest getUpcomingRequest,
  );

  @GET(EndPoints.popular)
  Future<HttpResponse<GetMovieReponseModel>> getPopular(
    @Queries() final GetMovieRequest getPopularRequest,
  );

  @GET(EndPoints.topRated)
  Future<HttpResponse<GetMovieReponseModel>> getTopRated(
    @Queries() final GetMovieRequest getTopRatdRequest,
  );
}
