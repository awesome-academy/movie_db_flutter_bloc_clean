// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '/src/injectable.dart';
import '/src/presentation/blocs/app_setting/app_setting_bloc.dart';
import '/src/presentation/upcoming/bloc/upcoming_bloc.dart';
import '/src/presentation/upcoming/widgets/upcoming_body.dart';
import '/src/presentation/widgets/alert.dart';

class UpComingPage extends StatelessWidget {
  const UpComingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final language = context.read<AppSettingBloc>().state.language;
    return BlocProvider(
      create: (context) => getIt<UpcomingBloc>()
        ..add(UpcomingStarted())
        ..add(UpcomingGot(language)),
      child: BlocBuilder<UpcomingBloc, UpcomingState>(
        builder: (context, state) => const UpcomingView(),
      ),
    );
  }
}

class UpcomingView extends StatelessWidget {
  const UpcomingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocListener<UpcomingBloc, UpcomingState>(
        listener: (context, state) {
          if (state.apiError != null) {
            Alert.showAlert(context, state.apiError?.message);
          }
        },
        child: RefreshIndicator(
          onRefresh: () async {
            final language = context.read<AppSettingBloc>().state.language;
            context.read<UpcomingBloc>().add(UpcomingStarted());
            context.read<UpcomingBloc>().add(UpcomingGot(language));
          },
          child: const UpcomingBody(),
        ),
      );
}
