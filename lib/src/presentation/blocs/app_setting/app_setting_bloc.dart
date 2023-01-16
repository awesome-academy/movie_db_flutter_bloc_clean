// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import '/src/data/datasources/local/cache_key.dart';

part 'app_setting_event.dart';
part 'app_setting_state.dart';

class AppSettingBloc extends Bloc<AppSettingEvent, AppSettingState> {
  AppSettingBloc() : super(const AppSettingState()) {
    on<AppSettingLanguageChanged>((event, emit) async {
      emit(state.copyWith(language: event.language));
      final prefs = await SharedPreferences.getInstance();
      if (event.language == Language.vi) {
        await prefs.setString(CacheKey.language, 'vi');
      } else {
        await prefs.setString(CacheKey.language, 'en');
      }
    });
    on<AppSettingStated>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      final String? language = prefs.getString(CacheKey.language);
      if (language == 'vi') {
        emit(state.copyWith(language: Language.vi));
      } else {
        emit(state.copyWith(language: Language.en));
      }
    });
  }
}
