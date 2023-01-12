import 'dart:io';

import '../datasources/local/app_cache.dart';
import '../datasources/remote/{{services.snakeCase()}}_service.dart';
import '/src/domain/repositories/{{name.snakeCase()}}_repository.dart';
import '/src/core/resource/data_state.dart';
import 'package:retrofit/dio.dart';
import '../../core/error/api_error.dart';
{{#method}}import '/src/core/request/{{name.snakeCase()}}_request/{{.}}_{{name.snakeCase()}}_request.dart';{{/method}}
{{#method}}import '../../domain/entities/{{name.snakeCase()}}_response/{{.}}_{{name.snakeCase()}}_response_model.dart';{{/method}}
import '../../domain/entities/{{name.snakeCase()}}_response/{{name.snakeCase()}}_model.dart';

class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  {{name.pascalCase()}}RepositoryImpl(this._{{services.camelCase()}}Service, this._appCache);

  final {{services.pascalCase()}}Service _{{services.camelCase()}}Service;
  final AppCache _appCache;
  {{#method}}
  @override
  Future<DataState<{{name.pascalCase()}}Model?>> {{.}}{{name.pascalCase()}}(
    {{..pascalCase()}}{{name.pascalCase()}}Request params,
  ) async {
    try {
      final HttpResponse<{{..pascalCase()}}{{name.pascalCase()}}ResponseModel> httpResponse =
          await _{{services.camelCase()}}Service.{{.}}{{name.pascalCase()}}();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(
          httpResponse.data.data,
        );
      }

      return DataFailed(
        ApiError(message: httpResponse.response.statusMessage),
      );
    } on ApiError catch (e) {
      return DataFailed(e);
    }
  }
  {{/method}} {{#local_method}}
  @override
  Future<bool> {{..camelCase()}}{{name.pascalCase()}}(
    {{name.pascalCase()}}Model params,
  ) {
    // TODO: {{..camelCase()}}{{name.pascalCase()}}
    throw UnimplementedError();
  }
  {{/local_method}}
}
