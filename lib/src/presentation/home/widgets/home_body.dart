// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Project imports:
import '../bloc/home_bloc.dart';
import '/src/presentation/home/widgets/show_list_movie_horizontal.dart';
import '/src/presentation/home/widgets/upcoming_image.dart';
import 'home_app_bar.dart';
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
            HomeAppBar(),
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
            current.topRatedStatus == UpcomingStatus.success ||
            current.topRatedStatus == UpcomingStatus.loading,
        buildLoadingWhen: (state) =>
            state.topRatedStatus == UpcomingStatus.loading,
        buildSuccesWhen: (state) =>
            state.topRatedStatus == UpcomingStatus.success,
        dataBuildSuccessWhen: (state) => state.topRatedData ?? [],
      );

  Widget buildPopular() => ShowListMovieHorizontal(
        itemCountLoading: 2,
        title: AppLocalizations.of(context).popular,
        buildWhen: (previous, current) =>
            current.popularStatus == UpcomingStatus.success ||
            current.popularStatus == UpcomingStatus.loading,
        buildLoadingWhen: (state) =>
            state.popularStatus == UpcomingStatus.loading,
        buildSuccesWhen: (state) =>
            state.popularStatus == UpcomingStatus.success,
        dataBuildSuccessWhen: (state) => state.popularData ?? [],
      );
}
