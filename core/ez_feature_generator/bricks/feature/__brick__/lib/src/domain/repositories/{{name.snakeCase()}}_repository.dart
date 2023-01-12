{{#method}}import '/src/core/request/{{name.snakeCase()}}_request/{{.}}_{{name.snakeCase()}}_request.dart';
{{/method}}
import '/src/core/resource/data_state.dart';

import 'package:injectable/injectable.dart';
import '../../data/repositories/{{name.snakeCase()}}_repository_impl.dart';
import '../../data/datasources/remote/{{services.snakeCase()}}_service.dart';
import '../../data/datasources/local/app_cache.dart';
import '../entities/{{name.snakeCase()}}_response/{{name.snakeCase()}}_model.dart';

@injectable
abstract class {{name.pascalCase()}}Repository {

  @factoryMethod
  static {{name.pascalCase()}}Repository create({{services.pascalCase()}}Service services, AppCache appcache) =>
     {{name.pascalCase()}}RepositoryImpl(services, appcache);

  {{#method}}
  Future<DataState<{{name.pascalCase()}}Model?>> {{..camelCase()}}{{name.pascalCase()}}(
    {{..pascalCase()}}{{name.pascalCase()}}Request params,
  );
  {{/method}}

  {{#local_method}}
  Future<bool> {{..camelCase()}}{{name.pascalCase()}}(
    {{name.pascalCase()}}Model params,
  );
  {{/local_method}}
}
