import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/api_error.dart';
import '../../../core/resource/data_state.dart'; {{#local_method}}
import '../../../domain/use_cases/{{name.snakeCase()}}_use_cases/{{..snakeCase()}}_{{name.snakeCase()}}_use_case.dart';{{/local_method}} 
import 'package:flutter_bloc/flutter_bloc.dart'; {{#method}}
import '../../../domain/use_cases/{{name.snakeCase()}}_use_cases/{{..snakeCase()}}_{{name.snakeCase()}}_use_case.dart';{{/method}} {{#method}}
import '../../../core/request/{{name.snakeCase()}}_request/{{..snakeCase()}}_{{name.snakeCase()}}_request.dart';{{/method}}
import '../../../domain/entities/{{name.snakeCase()}}_response/{{name.snakeCase()}}_model.dart';
part '{{name.snakeCase()}}_event.dart';
part '{{name.snakeCase()}}_state.dart';

@injectable
class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{name.pascalCase()}}Bloc({{#method}}
    this._{{..camelCase()}}{{name.pascalCase()}}UseCase, {{/method}}{{#local_method}}
    this._{{..camelCase()}}{{name.pascalCase()}}UseCase, {{/local_method}}
  ) : super(const {{name.pascalCase()}}State()) { 
    on<{{name.pascalCase()}}Started>(started);{{#method}}
    on<{{name.pascalCase()}}{{..pascalCase()}}>({{..camelCase()}});{{/method}}{{#local_method}}
    on<{{name.pascalCase()}}{{..pascalCase()}}>({{..camelCase()}});{{/local_method}}
  }

  @factoryMethod
  factory {{name.pascalCase()}}Bloc.from( {{#method}}
    final {{..pascalCase()}}{{name.pascalCase()}}UseCase {{..camelCase()}}{{name.pascalCase()}}UseCase,{{/method}} {{#local_method}}
    final {{..pascalCase()}}{{name.pascalCase()}}UseCase {{..camelCase()}}{{name.pascalCase()}}UseCase,{{/local_method}}
  ) =>
     {{name.pascalCase()}}Bloc( {{#method}}
        {{..camelCase()}}{{name.pascalCase()}}UseCase,{{/method}} {{#local_method}}
        {{..camelCase()}}{{name.pascalCase()}}UseCase,{{/local_method}}
      );
  {{#method}}
  final {{..pascalCase()}}{{name.pascalCase()}}UseCase _{{..camelCase()}}{{name.pascalCase()}}UseCase;  {{/method}} {{#local_method}}
  final {{..pascalCase()}}{{name.pascalCase()}}UseCase _{{..camelCase()}}{{name.pascalCase()}}UseCase;  {{/local_method}}

  Future<void> started(
    {{name.pascalCase()}}Started event,
    Emitter<SettingState> emit,
  ) async {}

  {{#method}}
  Future<void> {{..camelCase()}}(
    {{name.pascalCase()}}{{..pascalCase()}} event,
    Emitter<{{name.pascalCase()}}State> emit,
  ) async {
    emit(state.copyWith(status: {{name.pascalCase()}}Status.loading));
    final DataState<{{name.pascalCase()}}Model?> dataState = await _{{..camelCase()}}{{name.pascalCase()}}UseCase.call(
      params: {{..pascalCase()}}{{name.pascalCase()}}Request(
      ),
    );

    if (dataState is DataSuccess && dataState.data != null) {
      emit(state.copyWith(status: {{name.pascalCase()}}Status.success));
    }

    if (dataState is DataFailed) {
      emit(state.copyWith(
        status: {{name.pascalCase()}}Status.failure,
        apiError: dataState.error,
      ));
    }
  }{{/method}}

  {{#local_method}}
  Future<void> {{..camelCase()}}(
    {{name.pascalCase()}}{{..pascalCase()}} event,
    Emitter<{{name.pascalCase()}}State> emit,
  ) async {
    final bool? result = await _{{..camelCase()}}{{name.pascalCase()}}UseCase.call(
      params: {{name.pascalCase()}}Model(),
    );
    // TODO: Implement method
  }{{/local_method}}
  
}
