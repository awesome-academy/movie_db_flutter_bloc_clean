// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// Project imports:
import '/src/core/utils/extensions/dimension.dart';
import '/src/core/utils/gen/colors.gen.dart';
import '/src/domain/entities/home_response/movie_model.dart';
import '/src/presentation/blocs/app_setting/app_setting_bloc.dart';
import '/src/presentation/home/bloc/home_bloc.dart';
import '/src/presentation/popular/bloc/popular_bloc.dart';
import '/src/presentation/widgets/base_app_bar.dart';
import '/src/presentation/widgets/has_more_data.dart';
import '/src/presentation/widgets/list_movie_loading.dart';
import '/src/presentation/widgets/movie_item.dart';

class PopularBody extends StatefulWidget {
  const PopularBody({super.key});

  @override
  State<PopularBody> createState() => _PopularBodyState();
}

class _PopularBodyState extends State<PopularBody> {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    addListener();
  }

  void addListener() {
    controller.addListener(() {
      final hasMore = context.read<PopularBloc>().state.hasMore;
      if (controller.position.pixels == controller.position.maxScrollExtent &&
          hasMore) {
        final language = context.read<AppSettingBloc>().state.language;
        context.read<PopularBloc>().add(PopularLoadMore(language));
      }
    });
  }

  @override
  Widget build(BuildContext context) => Container(
        width: Dimensions.screenWidth(context),
        height: Dimensions.screenHeight(context),
        child: Column(
          children: [
            BaseAppBar(
              title: AppLocalizations.of(context).popular,
            ),
            const SizedBox(height: 20),
            buildListItem(),
          ],
        ),
      );

  Widget buildListItem() => BlocBuilder<PopularBloc, PopularState>(
        buildWhen: (previous, current) =>
            (current.popularStatus == NetworkDataStatus.loading &&
                previous.popularStatus == NetworkDataStatus.initial) ||
            current.popularStatus == NetworkDataStatus.success,
        builder: (context, state) {
          if (state.popularStatus == NetworkDataStatus.loading) {
            return const ListMovieLoading(
              count: 6,
              isExpaded: true,
            );
          }
          final _list = state.popularData ?? [];
          return buildListSuccess(_list);
        },
      );

  Widget buildListSuccess(List<MovieModel> list) => Expanded(
        child: SingleChildScrollView(
          controller: controller,
          child: Column(
            children: [
              StaggeredGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                axisDirection: AxisDirection.down,
                children: [
                  ...list
                      .map((movie) => MovieItem(
                          path: movie.backdropPath ?? '',
                          description: buildContent(movie.popularity),
                          title: movie.title ?? ''))
                      .toList(),
                ],
              ),
              HasMoreData(hasMore: context.watch<PopularBloc>().state.hasMore),
            ],
          ),
        ),
      );

  Widget buildContent(double? popularity) => Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          children: [
            const Icon(
              Icons.stars_rounded,
              color: ColorName.primary,
              size: 16,
            ),
            const SizedBox(width: 10),
            Text(
              '$popularity',
              style: const TextStyle(color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
}
