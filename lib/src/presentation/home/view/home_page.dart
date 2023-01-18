// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '/src/injectable.dart';
import '/src/presentation/blocs/app_setting/app_setting_bloc.dart';
import '/src/presentation/home/bloc/home_bloc.dart';
import '/src/presentation/home/widgets/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final language = context.read<AppSettingBloc>().state.language;
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()
        ..add(HomeStarted())
        ..add(HomeGetUpcoming(language)),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => const HomeView(),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.upcomingStatus == NetworkDataStatus.success &&
              state.topRatedStatus == NetworkDataStatus.initial) {
            context.read<HomeBloc>().add(
                HomeGetTopRated(context.read<AppSettingBloc>().state.language));
          }
          if (state.topRatedStatus == NetworkDataStatus.success &&
              state.popularStatus == NetworkDataStatus.initial) {
            context.read<HomeBloc>().add(
                HomeGetPopular(context.read<AppSettingBloc>().state.language));
          }
        },
        child: RefreshIndicator(
          onRefresh: () async {
            final language = context.read<AppSettingBloc>().state.language;
            context.read<HomeBloc>().add(HomeStarted());
            context.read<HomeBloc>().add(HomeGetUpcoming(language));
          },
          child: const HomeBody(),
        ),
      );
}
