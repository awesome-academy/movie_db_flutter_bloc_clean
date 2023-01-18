part of 'home_bloc.dart';

enum NetworkDataStatus { initial, loading, success, failure }

@immutable
class HomeState extends Equatable {
  const HomeState({
    this.upcomingStatus = NetworkDataStatus.initial,
    this.upcomingData,
    this.topRatedStatus = NetworkDataStatus.initial,
    this.topRatedData,
    this.popularStatus = NetworkDataStatus.initial,
    this.popularData,
    this.apiError,
  });

  final NetworkDataStatus upcomingStatus;
  final List<MovieModel>? upcomingData;

  final NetworkDataStatus topRatedStatus;
  final List<MovieModel>? topRatedData;

  final NetworkDataStatus popularStatus;
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
    NetworkDataStatus? upcomingStatus,
    List<MovieModel>? upcomingData,
    NetworkDataStatus? topRatedStatus,
    List<MovieModel>? topRatedData,
    NetworkDataStatus? popularStatus,
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
