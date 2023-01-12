
import 'package:mocktail/mocktail.dart';
{{#method}} 
import 'package:{{project.snakeCase()}}/src/domain/use_cases/{{name.snakeCase()}}_use_cases/{{..snakeCase()}}_{{name.snakeCase()}}_use_case.dart'; {{/method}} {{#local_method}} 
import 'package:{{project.snakeCase()}}/src/domain/use_cases/{{name.snakeCase()}}_use_cases/{{..snakeCase()}}_{{name.snakeCase()}}_use_case.dart'; {{/local_method}}
{{#method}} 
class Mock{{..pascalCase()}}{{name.pascalCase()}}UseCase extends Mock implements {{..pascalCase()}}{{name.pascalCase()}}UseCase {{/method}} {} 
{{#local_method}} 
class Mock{{..pascalCase()}}{{name.pascalCase()}}UseCase extends Mock implements {{..pascalCase()}}{{name.pascalCase()}}UseCase {} 
{{/local_method}} 

