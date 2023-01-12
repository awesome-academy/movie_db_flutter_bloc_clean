part of '{{name.snakeCase()}}_bloc.dart';

@immutable
abstract class {{name.pascalCase()}}Event extends Equatable {
    @override
  List<Object?> get props => [];
}

class {{name.pascalCase()}}Started extends {{name.pascalCase()}}Event {}

{{#method}}class {{name.pascalCase()}}{{..pascalCase()}} extends {{name.pascalCase()}}Event {}
{{/method}} {{#local_method}}
class {{name.pascalCase()}}{{..pascalCase()}} extends {{name.pascalCase()}}Event {}
{{/local_method}}