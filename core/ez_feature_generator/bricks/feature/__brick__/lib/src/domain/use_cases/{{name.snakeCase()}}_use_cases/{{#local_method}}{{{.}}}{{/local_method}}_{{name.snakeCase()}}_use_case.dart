import '/src/domain/entities/{{name.snakeCase()}}_response/{{name.snakeCase()}}_model.dart';
import 'package:injectable/injectable.dart';

import '../../../core/usecase/usecase.dart';
import '../../repositories/{{name.snakeCase()}}_repository.dart';

@injectable
class {{#local_method}}{{..pascalCase()}}{{/local_method}}{{name.pascalCase()}}UseCase implements UseCase<void, {{name.pascalCase()}}Model> {
  {{#local_method}}{{..pascalCase()}}{{/local_method}}{{name.pascalCase()}}UseCase(this._{{name.camelCase()}}Repository);

  final {{name.pascalCase()}}Repository _{{name.camelCase()}}Repository;

  @override
  Future call({
    required {{name.pascalCase()}}Model params,
  }) {
    return _{{name.camelCase()}}Repository.{{#local_method}}{{..camelCase()}}{{/local_method}}{{name.pascalCase()}}(params);
  }
}
