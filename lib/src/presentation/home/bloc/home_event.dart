part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeStarted extends HomeEvent {}

class HomeGetUpcoming extends HomeEvent {
  final Language language;

  HomeGetUpcoming(this.language);

  @override
  List<Object?> get props => [language];
}

class HomeGetPopular extends HomeEvent {
  final Language language;

  HomeGetPopular(this.language);

  @override
  List<Object?> get props => [language];
}

class HomeGetTopRated extends HomeEvent {
  final Language language;

  HomeGetTopRated(this.language);

  @override
  List<Object?> get props => [language];
}

class HomeCheckFavorite extends HomeEvent {}

class HomeRemoveFavorite extends HomeEvent {}

class HomeAddFavorite extends HomeEvent {}
