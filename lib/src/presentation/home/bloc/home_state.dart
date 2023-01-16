part of 'home_bloc.dart';

enum UpcomingStatus { initial, loading, success, failure }

@immutable
class HomeState extends Equatable {
  const HomeState({
    this.upcomingStatus = UpcomingStatus.initial,
    this.upcomingData,
    this.topRatedStatus = UpcomingStatus.initial,
    this.topRatedData,
    this.popularStatus = UpcomingStatus.initial,
    this.popularData,
    this.apiError,
  });

  final UpcomingStatus upcomingStatus;
  final List<MovieModel>? upcomingData;

  final UpcomingStatus topRatedStatus;
  final List<MovieModel>? topRatedData;

  final UpcomingStatus popularStatus;
  final List<MovieModel>? popularData;

  final ApiError? apiError;

  @override
  List<Object?> get props => [
        upcomingStatus,
        upcomingData,
        topRatedStatus,
        topRatedData,
        popularStatus,
        popularData,
        apiError,
      ];

  HomeState copyWith({
    UpcomingStatus? upcomingStatus,
    List<MovieModel>? upcomingData,
    UpcomingStatus? topRatedStatus,
    List<MovieModel>? topRatedData,
    UpcomingStatus? popularStatus,
    List<MovieModel>? popularData,
    ApiError? apiError,
  }) =>
      HomeState(
        upcomingStatus: upcomingStatus ?? this.upcomingStatus,
        upcomingData: upcomingData ?? this.upcomingData,
        topRatedStatus: topRatedStatus ?? this.topRatedStatus,
        topRatedData: topRatedData ?? this.topRatedData,
        popularStatus: popularStatus ?? this.popularStatus,
        popularData: popularData ?? this.popularData,
        apiError: apiError ?? this.apiError,
      );
}
