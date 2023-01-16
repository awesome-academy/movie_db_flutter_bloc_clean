import 'package:ez_cache/ez_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_db_flutter_bloc_clean/src/data/datasources/local/app_cache.dart';
import 'package:movie_db_flutter_bloc_clean/src/presentation/main/main_page.dart';

import 'flavors.dart';

void main() => MyApp.run(environment: Environment.dev, isDebug: true);

class MyApp {
  MyApp();

  static Future<void> run({
    required bool isDebug,
    required Environment environment,
  }) async {
    await AppCache.instance.init(HiveCache());
    runApp(const App());
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
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
        locale: const Locale('en'),
        debugShowCheckedModeBanner: false,
        home: const MainPgae(),
      );
}
