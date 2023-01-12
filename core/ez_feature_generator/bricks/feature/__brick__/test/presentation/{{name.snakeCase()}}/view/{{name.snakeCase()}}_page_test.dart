import 'package:flutter_test/flutter_test.dart';
import 'package:{{project.snakeCase()}}/src/injectable.dart';
import 'package:{{project.snakeCase()}}/src/presentation/{{name.snakeCase()}}/bloc/{{name.snakeCase()}}_bloc.dart';
import 'package:{{project.snakeCase()}}/src/presentation/{{name.snakeCase()}}/view/{{name.snakeCase()}}_page.dart';

import '../../../pump_app.dart';
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

  group('{{name.pascalCase()}}Page', () {
    testWidgets('renders {{name.pascalCase()}}View', (final tester) async {
      await tester.pumpApp(const {{name.pascalCase()}}Page());
      expect(find.byType({{name.pascalCase()}}View), findsOneWidget);
    });
  });
}
