// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';

// Project imports:
import '/src/core/utils/extensions/dimension.dart';
import '/src/core/utils/gen/colors.gen.dart';
import '/src/domain/entities/home_response/movie_model.dart';
import '/src/presentation/blocs/app_setting/app_setting_bloc.dart';
import '/src/presentation/home/bloc/home_bloc.dart';
import '/src/presentation/upcoming/bloc/upcoming_bloc.dart';
import '/src/presentation/widgets/base_app_bar.dart';
import '/src/presentation/widgets/has_more_data.dart';
import '/src/presentation/widgets/list_movie_loading.dart';
import '/src/presentation/widgets/movie_item.dart';
import '/src/presentation/widgets/shimmer.dart';

class UpcomingBody extends StatefulWidget {
  const UpcomingBody({super.key});

  @override
  State<UpcomingBody> createState() => _UpcomingBodyState();
}

class _UpcomingBodyState extends State<UpcomingBody> {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    addListener();
  }

  void addListener() {
    controller.addListener(() {
      final hasMore = context.read<UpcomingBloc>().state.hasMore;
      if (controller.position.pixels == controller.position.maxScrollExtent &&
          hasMore) {
        final language = context.read<AppSettingBloc>().state.language;
        context.read<UpcomingBloc>().add(UpcomingLoadMore(language));
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
              title: AppLocalizations.of(context).coming,
            ),
            const SizedBox(height: 20),
            buildListItem(),
          ],
        ),
      );

  Widget buildListItem() => BlocBuilder<UpcomingBloc, UpcomingState>(
        buildWhen: (previous, current) =>
            (current.upcomingStatus == NetworkDataStatus.loading &&
                previous.upcomingStatus == NetworkDataStatus.initial) ||
            current.upcomingStatus == NetworkDataStatus.success,
        builder: (context, state) {
          if (state.upcomingStatus == NetworkDataStatus.loading) {
            return const ListMovieLoading(count: 6, isExpaded: true);
          }
          final _list = state.upcomingData ?? [];
          return buildListSuccess(_list);
        },
      );

  Widget buildListLoading(int count) => Expanded(
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          axisDirection: AxisDirection.down,
          children: [
            for (int i = 0; i < count; i++)
              const StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 3,
                child: RectangleShimmer(),
              ),
          ],
        ),
      );

  Widget buildListSuccess(List<MovieModel> list) {
    const double spacing = 10;
    const double running = 10;
    const int crossCount = 4;

    return Expanded(
      child: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            StaggeredGrid.count(
              crossAxisCount: crossCount,
              mainAxisSpacing: spacing,
              crossAxisSpacing: running,
              axisDirection: AxisDirection.down,
              children: [
                ...list
                    .map((movie) => MovieItem(
                        path: movie.backdropPath ?? '',
                        description: buildContent(movie.releaseDate),
                        title: movie.title ?? ''))
                    .toList(),
              ],
            ),
            HasMoreData(hasMore: context.watch<UpcomingBloc>().state.hasMore),
          ],
        ),
      ),
    );
  }

  Widget buildContent(DateTime? releaseDate) {
    final df = new DateFormat('dd/MM/yyyy');
    final dateRelease = df.format(
      releaseDate ?? DateTime.now(),
    );
    const double iconSize = 16;

    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          const Icon(
            Icons.date_range,
            color: ColorName.primary,
            size: iconSize,
          ),
          const SizedBox(width: 10),
          Text(
            '$dateRelease',
            style: const TextStyle(color: Colors.white),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
