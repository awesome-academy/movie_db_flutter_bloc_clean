part of 'upcoming_bloc.dart';

class UpcomingState extends Equatable {
  const UpcomingState({
    this.upcomingStatus = NetworkDataStatus.initial,
    this.upcomingData,
    this.hasMore = false,
    this.apiError,
  });

  final NetworkDataStatus upcomingStatus;
  final List<MovieModel>? upcomingData;
  final bool hasMore;
  final ApiError? apiError;

  @override
  List<Object?> get props => [upcomingStatus, upcomingData, hasMore, apiError];

  UpcomingState copyWith({
    NetworkDataStatus? upcomingStatus,
    List<MovieModel>? upcomingData,
    bool? hasMore,
    ApiError? apiError,
  }) =>
      UpcomingState(
        upcomingStatus: upcomingStatus ?? this.upcomingStatus,
        upcomingData: upcomingData ?? this.upcomingData,
        hasMore: hasMore ?? this.hasMore,
        apiError: apiError ?? this.apiError,
      );
}
