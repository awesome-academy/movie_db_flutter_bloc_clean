import 'package:flutter_test/flutter_test.dart';
import 'package:{{project.snakeCase()}}/src/injectable.dart';
import 'package:{{project.snakeCase()}}/src/presentation/{{name.snakeCase()}}/bloc/{{name.snakeCase()}}_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import '../../../domain/use_cases/mock_{{name.snakeCase()}}_repository.dart';

Future<void> main() async {
  late {{name.pascalCase()}}Bloc {{name.camelCase()}}Bloc; {{#method}} 
  Mock{{..pascalCase()}}{{name.pascalCase()}}UseCase mock{{..pascalCase()}}{{name.pascalCase()}}UseCase;  {{/method}}  {{#local_method}} 
  Mock{{..pascalCase()}}{{name.pascalCase()}}UseCase mock{{..pascalCase()}}{{name.pascalCase()}}UseCase;  {{/local_method}} 
  setUpAll(() async {
    configureDependencies(); {{#method}} 
    mock{{..pascalCase()}}{{name.pascalCase()}}UseCase = Mock{{..pascalCase()}}{{name.pascalCase()}}UseCase();  {{/method}}  {{#local_method}} 
    mock{{..pascalCase()}}{{name.pascalCase()}}UseCase = Mock{{..pascalCase()}}{{name.pascalCase()}}UseCase();  {{/local_method}} 
    {{name.camelCase()}}Bloc = {{name.pascalCase()}}Bloc( {{#method}} 
      mock{{..pascalCase()}}{{name.pascalCase()}}UseCase, {{/method}}  {{#local_method}} 
      mock{{..pascalCase()}}{{name.pascalCase()}}UseCase, {{/local_method}} 
    );
    await getIt.unregister<{{name.pascalCase()}}Bloc>();
    getIt.registerFactory<{{name.pascalCase()}}Bloc>(() => {{name.camelCase()}}Bloc);
  });

  group('{{name.pascalCase()}}Bloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          {{name.camelCase()}}Bloc,
          isNotNull,
        );
      });
    });

    test('initial state has value params', () {
      final updateBloc = {{name.camelCase()}}Bloc..add({{name.pascalCase()}}Started());
      expect(updateBloc.state, equals(const {{name.pascalCase()}}State()));
    });

    blocTest<{{name.pascalCase()}}Bloc, {{name.pascalCase()}}State>(
      '{{name.pascalCase()}}Started emits',
      build: () {
        return {{name.camelCase()}}Bloc;
      },
      act: (final bloc) => bloc.add({{name.pascalCase()}}Started()),
      expect: () => <{{name.pascalCase()}}State>[],
    );
  });
}
