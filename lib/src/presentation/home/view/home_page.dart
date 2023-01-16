// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:movie_db_flutter_bloc_clean/src/presentation/blocs/app_setting/app_setting_bloc.dart';
import '/src/injectable.dart';
import '/src/presentation/home/bloc/home_bloc.dart';
import '/src/presentation/home/widgets/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => getIt<HomeBloc>()
          ..add(HomeStarted())
          ..add(HomeGetUpcoming(context.read<AppSettingBloc>().state.language)),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) => const HomeView(),
        ),
      );
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.upcomingStatus == UpcomingStatus.success &&
              state.topRatedStatus == UpcomingStatus.initial) {
            context.read<HomeBloc>().add(
                HomeGetTopRated(context.read<AppSettingBloc>().state.language));
          }
          if (state.topRatedStatus == UpcomingStatus.success &&
              state.popularStatus == UpcomingStatus.initial) {
            context.read<HomeBloc>().add(
                HomeGetPopular(context.read<AppSettingBloc>().state.language));
          }
        },
        child: const HomeBody(),
      );
}
