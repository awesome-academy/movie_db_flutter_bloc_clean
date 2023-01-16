// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '/src/core/usecase/usecase.dart';
import '/src/domain/entities/home_response/movie_model.dart';
import '/src/domain/repositories/home_repository.dart';

@injectable
class AddFavoriteHomeUseCase implements UseCase<void, MovieModel> {
  AddFavoriteHomeUseCase(this._homeRepository);

  final HomeRepository _homeRepository;

  @override
  Future call({
    required MovieModel params,
  }) =>
      _homeRepository.addFavoriteHome(params);
}
