part of 'upcoming_bloc.dart';

abstract class PopularEvent extends Equatable {
  const PopularEvent();

  @override
  List<Object> get props => [];
}

class UpcomingStarted extends PopularEvent {}

class UpcomingGot extends PopularEvent {
  final Language language;

  const UpcomingGot(this.language);

  @override
  List<Object> get props => [language];
}

class UpcomingLoadMore extends PopularEvent {
  final Language language;

  const UpcomingLoadMore(this.language);

  @override
  List<Object> get props => [language];
}
