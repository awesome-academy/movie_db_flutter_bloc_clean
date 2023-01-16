// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '/src/core/request/home_request/get_home_request.dart';
import '/src/core/resource/data_source.dart';
import '/src/core/usecase/usecase.dart';
import '/src/domain/entities/home_response/movie_model.dart';
import '/src/domain/repositories/home_repository.dart';

@injectable
class GetTopRatedUseCase
    implements UseCase<DataState<List<MovieModel>?>, GetMovieRequest> {
  GetTopRatedUseCase(this._homeRepository);

  final HomeRepository _homeRepository;

  @override
  Future<DataState<List<MovieModel>?>> call({
    required GetMovieRequest params,
  }) =>
      _homeRepository.getTopRated(params);
}
