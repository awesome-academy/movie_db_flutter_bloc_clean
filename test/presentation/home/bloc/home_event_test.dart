// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:movie_db_flutter_bloc_clean/src/presentation/home/bloc/home_bloc.dart';

void main() {
  group('HomeEvent', () {
    group('HomeStarted', () {
      test('supports value equality', () {
        expect(HomeStarted(), isNotNull);
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          HomeStarted(),
          equals(HomeStarted()),
        );
      });
    });
  });
}
