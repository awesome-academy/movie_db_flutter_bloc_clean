part of 'popular_bloc.dart';

abstract class PopularEvent extends Equatable {
  const PopularEvent();

  @override
  List<Object> get props => [];
}

class PopularStarted extends PopularEvent {}

class PopularGot extends PopularEvent {
  final Language language;

  const PopularGot(this.language);

  @override
  List<Object> get props => [language];
}

class PopularLoadMore extends PopularEvent {
  final Language language;

  const PopularLoadMore(this.language);

  @override
  List<Object> get props => [language];
}
