// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:ez_cache/ez_cache.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Project imports:
import '/src/data/datasources/local/app_cache.dart';
import '/src/injectable.dart';
import '/src/presentation/main/main_page.dart';
import 'flavors.dart';
import 'src/presentation/blocs/app_setting/app_setting_bloc.dart';

void main() => MyApp.run(environment: Environment.dev, isDebug: true);

class MyApp {
  MyApp();

  static Future<void> run({
    required bool isDebug,
    required Environment environment,
  }) async {
    await AppCache.instance.init(HiveCache());
    configureDependencies();
    runApp(const App());
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<AppSettingBloc>(
            create: (BuildContext context) => AppSettingBloc(),
          ),
        ],
        child: BlocBuilder<AppSettingBloc, AppSettingState>(
          builder: (context, state) => MaterialApp(
            title: 'Movie DB',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: Colors.black,
            ),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'), // English
              Locale('vi'), // Vietnamese
            ],
            locale:
                context.watch<AppSettingBloc>().state.language == Language.vi
                    ? const Locale('vi')
                    : const Locale('en'),
            debugShowCheckedModeBanner: false,
            home: const MainPgae(),
          ),
        ),
      );
}
