import 'package:ez_cache/ez_cache.dart';
import 'package:flutter/material.dart';
import 'package:movie_db_flutter_bloc_clean/src/data/datasources/local/app_cache.dart';

import 'flavors.dart';

void main() => MyApp.run(environment: Environment.dev, isDebug: true);

class MyApp {
  MyApp();

  static Future<void> run({
    required bool isDebug,
    required Environment environment,
  }) async {
    // TODO: config injectable by environment
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
        ),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(),
      );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text('Movie DB Flutter Bloc + Clean Architecture'),
        ),
      );
}
