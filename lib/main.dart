import 'package:ez_cache/ez_cache.dart';
import 'package:flutter/material.dart';
import 'package:movie_db_flutter_bloc_clean/src/data/datasources/local/app_cache.dart';

void main() async {
  await AppCache.instance.init(HiveCache());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Movie DB',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
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
