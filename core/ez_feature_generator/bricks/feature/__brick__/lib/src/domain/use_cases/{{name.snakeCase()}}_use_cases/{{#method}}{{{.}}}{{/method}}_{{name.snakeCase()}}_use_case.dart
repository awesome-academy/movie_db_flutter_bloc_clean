import '/src/domain/entities/{{name.snakeCase()}}_response/{{name.snakeCase()}}_model.dart';
import '/src/core/resource/data_state.dart';
import '../../../core/usecase/usecase.dart';
import '../../repositories/{{name.snakeCase()}}_repository.dart';
import '../../../core/request/{{name.snakeCase()}}_request/{{#method}}{{..snakeCase()}}{{/method}}_{{name.snakeCase()}}_request.dart';

import 'package:injectable/injectable.dart';

@injectable
class {{#method}}{{..pascalCase()}}{{/method}}{{name.pascalCase()}}UseCase
    implements
        UseCase<DataState<{{name.pascalCase()}}Model?>, {{#method}}{{..pascalCase()}}{{/method}}{{name.pascalCase()}}Request> {
  {{#method}}{{..pascalCase()}}{{/method}}{{name.pascalCase()}}UseCase(this._{{name.camelCase()}}Repository);

  final {{name.pascalCase()}}Repository _{{name.camelCase()}}Repository;

  @override
  Future<DataState<{{name.pascalCase()}}Model?>> call({
    required {{#method}}{{..pascalCase()}}{{/method}}{{name.pascalCase()}}Request params,
  }) {
    return _{{name.camelCase()}}Repository.{{#method}}{{..camelCase()}}{{/method}}{{name.pascalCase()}}(params);
  }
}
