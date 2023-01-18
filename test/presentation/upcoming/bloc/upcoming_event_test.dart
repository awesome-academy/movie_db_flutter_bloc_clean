// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_db_flutter_bloc_clean/src/presentation/blocs/app_setting/app_setting_bloc.dart';

// Project imports:
import 'package:movie_db_flutter_bloc_clean/src/presentation/upcoming/bloc/upcoming_bloc.dart';

void main() {
  group('UpcomingEvent', () {
    group('UpcomingStarted', () {
      test('supports value equality', () {
        expect(UpcomingStarted(), isNotNull);
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          UpcomingStarted(),
          equals(UpcomingStarted()),
        );
      });
    });
  });

  group('UpcomingGot', () {
    const Language languageVi = Language.vi;
    const Language languageEn = Language.en;
    test('supports value equality 1', () {
      expect(const UpcomingGot(languageVi), isNotNull);
    });

    test('supports value equality 2', () {
      expect(
          const UpcomingGot(languageVi),
          isNot(
            const UpcomingGot(languageEn),
          ));
    });

    test('can be instantiated', () {
      expect(
        const UpcomingGot(languageVi),
        equals(const UpcomingGot(languageVi)),
      );
    });
  });

  group('UpcomingLoadMore', () {
    const Language languageVi = Language.vi;
    const Language languageEn = Language.en;
    test('supports value equality 1', () {
      expect(const UpcomingLoadMore(languageVi), isNotNull);
    });

    test('supports value equality 2', () {
      expect(
          const UpcomingLoadMore(languageVi),
          isNot(
            const UpcomingLoadMore(languageEn),
          ));
    });

    test('can be instantiated', () {
      expect(
        const UpcomingLoadMore(languageVi),
        equals(const UpcomingLoadMore(languageVi)),
      );
    });
  });
}
