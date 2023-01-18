part of 'popular_bloc.dart';

class PopularState extends Equatable {
  const PopularState({
    this.popularStatus = NetworkDataStatus.initial,
    this.popularData,
    this.hasMore = false,
    this.apiError,
  });

  final NetworkDataStatus popularStatus;
  final List<MovieModel>? popularData;
  final bool hasMore;
  final ApiError? apiError;

  @override
  List<Object?> get props => [popularStatus, popularData, hasMore, apiError];

  PopularState copyWith({
    NetworkDataStatus? popularStatus,
    List<MovieModel>? popularData,
    bool? hasMore,
    ApiError? apiError,
  }) =>
      PopularState(
        popularStatus: popularStatus ?? this.popularStatus,
        popularData: popularData ?? this.popularData,
        hasMore: hasMore ?? this.hasMore,
        apiError: apiError ?? this.apiError,
      );
}
