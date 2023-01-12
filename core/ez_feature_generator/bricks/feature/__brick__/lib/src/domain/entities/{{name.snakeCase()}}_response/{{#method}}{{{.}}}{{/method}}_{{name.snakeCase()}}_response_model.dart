import 'package:json_annotation/json_annotation.dart';

import '{{name.snakeCase()}}_model.dart';

part '{{#method}}{{..snakeCase()}}{{/method}}_{{name.snakeCase()}}_response_model.g.dart';

@JsonSerializable(createToJson: false)
class {{#method}}{{..pascalCase()}}{{/method}}{{name.pascalCase()}}ResponseModel {
  {{#method}}{{..pascalCase()}}{{/method}}{{name.pascalCase()}}ResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  factory {{#method}}{{..pascalCase()}}{{/method}}{{name.pascalCase()}}ResponseModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _${{#method}}{{..pascalCase()}}{{/method}}{{name.pascalCase()}}ResponseModelFromJson(json);

  final int? status;
  final int? code;
  final String? message;
  final {{name.pascalCase()}}Model? data;
}
