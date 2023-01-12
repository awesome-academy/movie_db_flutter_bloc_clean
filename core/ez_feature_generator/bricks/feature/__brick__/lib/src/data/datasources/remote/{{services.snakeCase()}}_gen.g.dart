{{#method}}
import '../../../domain/entities/{{name.snakeCase()}}_response/{{.}}_{{name.snakeCase()}}_response_model.dart';{{/method}}

{{#method}}
@{{..constantCase()}}(EndPoints.{{name.camelCase()}})
Future<HttpResponse<{{..pascalCase()}}{{name.pascalCase()}}ResponseModel>> {{..snakeCase()}}{{name.pascalCase()}}();{{/method}}

// TODO: add to Services