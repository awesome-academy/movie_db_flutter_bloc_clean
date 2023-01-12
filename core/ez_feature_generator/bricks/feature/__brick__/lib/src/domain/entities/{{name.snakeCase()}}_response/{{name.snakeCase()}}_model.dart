
import 'package:json_annotation/json_annotation.dart';

part '{{name.snakeCase()}}_model.g.dart';

@JsonSerializable(createToJson: false)
class {{name.pascalCase()}}Model {
  factory {{name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) => _${{name.pascalCase()}}ModelFromJson(json);

  {{name.pascalCase()}}Model();
} 
