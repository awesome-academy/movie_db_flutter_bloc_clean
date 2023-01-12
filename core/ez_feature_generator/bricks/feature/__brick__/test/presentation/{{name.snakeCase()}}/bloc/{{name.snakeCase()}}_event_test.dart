import 'package:flutter_test/flutter_test.dart';
import 'package:{{project.snakeCase()}}/src/presentation/{{name.snakeCase()}}/bloc/{{name.snakeCase()}}_bloc.dart';

void main() {
  group('{{name.pascalCase()}}Event', () {
    group('{{name.pascalCase()}}Started', () {
      test('supports value equality', () {
        expect({{name.pascalCase()}}Started(), isNotNull);
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          {{name.pascalCase()}}Started(),
          equals({{name.pascalCase()}}Started()),
        );
      });
    });
  });
}
