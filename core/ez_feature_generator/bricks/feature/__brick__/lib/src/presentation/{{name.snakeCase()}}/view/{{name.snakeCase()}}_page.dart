import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/{{name.snakeCase()}}_body.dart';
import '../bloc/{{name.snakeCase()}}_bloc.dart';
import '../../../injectable.dart';
import '../../widgets/progress_hub.dart';

class {{name.pascalCase()}}Page extends StatelessWidget {
  const {{name.pascalCase()}}Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<{{name.pascalCase()}}Bloc>()..add({{name.pascalCase()}}Started()),
      child: BlocBuilder<{{name.pascalCase()}}Bloc, {{name.pascalCase()}}State>(
        builder: (context, state) {
          return ProgressHub(
            running: state.status == {{name.pascalCase()}}Status.success,
            child: const {{name.pascalCase()}}View(),
          );
        },
      ),
    );
  }
}

class {{name.pascalCase()}}View extends StatelessWidget {
  const {{name.pascalCase()}}View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: {{name.pascalCase()}}Body(),
    );
  }
}
