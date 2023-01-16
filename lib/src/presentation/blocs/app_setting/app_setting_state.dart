part of 'app_setting_bloc.dart';

enum Language { en, vi }

class AppSettingState extends Equatable {
  const AppSettingState({this.language = Language.vi});

  final Language language;

  @override
  List<Object?> get props => [language];

  AppSettingState copyWith({Language? language}) =>
      AppSettingState(language: language ?? this.language);
}
