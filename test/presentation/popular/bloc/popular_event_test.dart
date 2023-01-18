// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_db_flutter_bloc_clean/src/presentation/blocs/app_setting/app_setting_bloc.dart';

// Project imports:
import 'package:movie_db_flutter_bloc_clean/src/presentation/popular/bloc/popular_bloc.dart';

void main() {
  group('PopularEvent', () {
    group('PopularStarted', () {
      test('supports value equality', () {
        expect(PopularStarted(), isNotNull);
      });
      test('can be instantiated', () {
        expect(
          PopularStarted(),
          equals(PopularStarted()),
        );
      });
    });

    group('PopularGot', () {
      const Language languageVi = Language.vi;
      const Language languageEn = Language.en;
      test('supports value equality 1', () {
        expect(const PopularGot(languageVi), isNotNull);
      });

      test('supports value equality 2', () {
        expect(
            const PopularGot(languageVi),
            isNot(
              const PopularGot(languageEn),
            ));
      });

      test('can be instantiated', () {
        expect(
          const PopularGot(languageVi),
          equals(const PopularGot(languageVi)),
        );
      });
    });

    group('PopularLoadMore', () {
      const Language languageVi = Language.vi;
      const Language languageEn = Language.en;
      test('supports value equality 1', () {
        expect(const PopularLoadMore(languageVi), isNotNull);
      });

      test('supports value equality 2', () {
        expect(
            const PopularLoadMore(languageVi),
            isNot(
              const PopularLoadMore(languageEn),
            ));
      });

      test('can be instantiated', () {
        expect(
          const PopularLoadMore(languageVi),
          equals(const PopularLoadMore(languageVi)),
        );
      });
    });
  });
}
