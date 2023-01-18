// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Project imports:
import '/src/presentation/home/bloc/home_bloc.dart';
import '/src/presentation/home/widgets/show_list_movie_horizontal.dart';
import '/src/presentation/home/widgets/upcoming_image.dart';
import '/src/presentation/widgets/base_app_bar.dart';
import 'upcoming_text.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  PageController? pageController;
  double viewportFraction = 0.8;
  double? pageOffset = 0;

  @override
  void initState() {
    pageController =
        PageController(initialPage: 0, viewportFraction: viewportFraction)
          ..addListener(() {
            setState(() {
              pageOffset = pageController!.page;
            });
          });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseAppBar(title: AppLocalizations.of(context).appName),
            UpcomingImage(
              pageOffset: pageOffset,
              pageController: pageController,
              viewportFraction: viewportFraction,
            ),
            UpcomingText(pageOffset: pageOffset),
            buildListMovie(),
            const SizedBox(height: 20),
          ],
        ),
      );

  Widget buildListMovie() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          buildTopRated(),
          const SizedBox(height: 20),
          buildPopular(),
        ],
      );

  Widget buildTopRated() => ShowListMovieHorizontal(
        itemCountLoading: 2,
        title: AppLocalizations.of(context).topRated,
        buildWhen: (previous, current) =>
            current.topRatedStatus == NetworkDataStatus.success ||
            current.topRatedStatus == NetworkDataStatus.loading,
        buildLoadingWhen: (state) =>
            state.topRatedStatus == NetworkDataStatus.loading,
        buildSuccesWhen: (state) =>
            state.topRatedStatus == NetworkDataStatus.success,
        dataBuildSuccessWhen: (state) => state.topRatedData ?? [],
      );

  Widget buildPopular() => ShowListMovieHorizontal(
        itemCountLoading: 2,
        title: AppLocalizations.of(context).popular,
        buildWhen: (previous, current) =>
            current.popularStatus == NetworkDataStatus.success ||
            current.popularStatus == NetworkDataStatus.loading,
        buildLoadingWhen: (state) =>
            state.popularStatus == NetworkDataStatus.loading,
        buildSuccesWhen: (state) =>
            state.popularStatus == NetworkDataStatus.success,
        dataBuildSuccessWhen: (state) => state.popularData ?? [],
      );
}
