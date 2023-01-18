// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '/src/core/request/home_request/get_home_request.dart';
import '/src/core/resource/data_source.dart';
import '/src/core/usecase/usecase.dart';
import '/src/domain/entities/home_response/get_home_response_model.dart';
import '/src/domain/repositories/home_repository.dart';

// Project imports:

@injectable
class GetUpcomingUseCase
    implements UseCase<DataState<GetUpComingResponseModel?>, GetMovieRequest> {
  GetUpcomingUseCase(this._homeRepository);

  final HomeRepository _homeRepository;

  @override
  Future<DataState<GetUpComingResponseModel?>> call({
    required GetMovieRequest params,
  }) =>
      _homeRepository.getUpcoming(params);
}
