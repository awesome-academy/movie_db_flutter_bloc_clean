// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:movie_db_flutter_bloc_clean/src/presentation/blocs/app_setting/app_setting_bloc.dart';
import '/src/injectable.dart';
import '/src/presentation/popular/bloc/popular_bloc.dart';
import '/src/presentation/popular/widgets/popular_body.dart';
import '/src/presentation/widgets/alert.dart';

class PopularPage extends StatelessWidget {
  const PopularPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final language = context.read<AppSettingBloc>().state.language;
    return BlocProvider(
      create: (context) => getIt<PopularBloc>()
        ..add(PopularStarted())
        ..add(PopularGot(language)),
      child: BlocBuilder<PopularBloc, PopularState>(
        builder: (context, state) => const PopularView(),
      ),
    );
  }
}

class PopularView extends StatelessWidget {
  const PopularView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocListener<PopularBloc, PopularState>(
        listener: (context, state) {
          if (state.apiError != null) {
            Alert.showAlert(context, state.apiError?.message);
          }
        },
        child: RefreshIndicator(
          onRefresh: () async {
            final language = context.read<AppSettingBloc>().state.language;
            context.read<PopularBloc>().add(PopularStarted());
            context.read<PopularBloc>().add(PopularGot(language));
          },
          child: const PopularBody(),
        ),
      );
}
