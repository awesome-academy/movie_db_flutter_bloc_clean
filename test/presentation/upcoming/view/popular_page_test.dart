// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:movie_db_flutter_bloc_clean/src/injectable.dart';
import 'package:movie_db_flutter_bloc_clean/src/presentation/upcoming/bloc/upcoming_bloc.dart';
import 'package:movie_db_flutter_bloc_clean/src/presentation/upcoming/view/upcoming_page.dart';
import '../../../domain/use_cases/mock_home_repository.dart';
import '../../../pump_app.dart';

Future<void> main() async {
  late UpcomingBloc upcomingBloc;
  late MockGetUpcomingUseCase mockGetUpcomingUseCase;
  late MockCheckFavoriteHomeUseCase mockCheckFavoriteHomeUseCase;
  late MockRemoveFavoriteHomeUseCase mockRemoveFavoriteHomeUseCase;
  late MockAddFavoriteHomeUseCase mockAddFavoriteHomeUseCase;
  setUpAll(() async {
    configureDependencies();
    mockGetUpcomingUseCase = MockGetUpcomingUseCase();
    mockCheckFavoriteHomeUseCase = MockCheckFavoriteHomeUseCase();
    mockRemoveFavoriteHomeUseCase = MockRemoveFavoriteHomeUseCase();
    mockAddFavoriteHomeUseCase = MockAddFavoriteHomeUseCase();
    upcomingBloc = UpcomingBloc(
      mockGetUpcomingUseCase,
      mockCheckFavoriteHomeUseCase,
      mockRemoveFavoriteHomeUseCase,
      mockAddFavoriteHomeUseCase,
    );
    await getIt.unregister<UpcomingBloc>();
    getIt.registerFactory<UpcomingBloc>(() => upcomingBloc);
  });

  group('UpcomingPage', () {
    testWidgets('renders UpcomingView', (final tester) async {
      await tester.pumpApp(const UpComingPage());
      expect(find.byType(UpcomingView), findsOneWidget);
    });
  });
}
