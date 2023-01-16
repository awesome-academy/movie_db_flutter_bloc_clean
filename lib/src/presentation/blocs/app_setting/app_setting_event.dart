part of 'app_setting_bloc.dart';

abstract class AppSettingEvent extends Equatable {
  const AppSettingEvent();

  @override
  List<Object> get props => [];
}

class AppSettingStated extends AppSettingEvent {
  const AppSettingStated();
}

class AppSettingLanguageChanged extends AppSettingEvent {
  final Language language;

  const AppSettingLanguageChanged(this.language);

  @override
  List<Object> get props => [language];
}
