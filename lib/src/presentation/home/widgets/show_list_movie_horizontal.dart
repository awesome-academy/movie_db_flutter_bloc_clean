// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '/src/core/utils/gen/colors.gen.dart';
import '/src/domain/entities/home_response/movie_model.dart';
import '/src/presentation/home/bloc/home_bloc.dart';
import '/src/presentation/widgets/shimmer.dart';

class ShowListMovieHorizontal extends StatelessWidget {
  const ShowListMovieHorizontal({
    required this.title,
    required this.buildWhen,
    required this.buildSuccesWhen,
    required this.buildLoadingWhen,
    required this.dataBuildSuccessWhen,
    this.itemCountLoading = 2,
    this.itemHeight = 100,
    super.key,
  });

  final String title;

  final bool Function(HomeState, HomeState) buildWhen;
  final bool Function(HomeState) buildSuccesWhen;
  final bool Function(HomeState) buildLoadingWhen;
  final List<MovieModel> Function(HomeState) dataBuildSuccessWhen;
  final int itemCountLoading;
  final double itemHeight;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: itemHeight,
            child: BlocBuilder<HomeBloc, HomeState>(
              buildWhen: buildWhen,
              builder: (context, state) {
                if (buildLoadingWhen(state)) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: buildShimmerUpcomingImage(context),
                    ),
                    itemCount: itemCountLoading,
                  );
                }
                if (buildSuccesWhen(state)) {
                  final List<MovieModel> data = dataBuildSuccessWhen(state);
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: buildItem(
                        data[index].backdropPath,
                        data[index].title,
                        index,
                        context,
                      ),
                    ),
                    itemCount: data.length,
                  );
                }
                return const SizedBox();
              },
            ),
          )
        ],
      );

  Widget buildItem(
    String? path,
    String? title,
    int index,
    BuildContext context,
  ) {
    const width = 100.0 * 1.78;
    const height = 100.0;
    final url = 'https://image.tmdb.org/t/p/w500$path';

    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: url,
          width: width,
          height: height,
          fit: BoxFit.cover,
          placeholder: (context, url) => buildShimmerUpcomingImage(context),
          errorWidget: (context, url, error) => const Center(
            child: Icon(Icons.error),
          ),
        ),
        buildGradient(width, height / 2),
        Positioned(
          bottom: 5,
          left: 5,
          right: 5,
          child: Text(
            '$title',
            style: const TextStyle(color: Colors.white),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget buildGradient(double width, double height) {
    final LinearGradient appBarLinear = LinearGradient(
      colors: [
        ColorName.tabbarColor.withOpacity(.1),
        Colors.black.withOpacity(.4),
      ],
      stops: const [0.0, 1.0],
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      tileMode: TileMode.repeated,
    );

    return Positioned(
      bottom: 0,
      child: Container(
        width: width,
        height: height / 2,
        decoration: BoxDecoration(gradient: appBarLinear),
      ),
    );
  }

  Widget buildShimmerUpcomingImage(BuildContext context) {
    const width = 100.0 * 1.78;
    const height = 100.0;
    return const Center(
      child: RectangleShimmer(
        width: width,
        height: height,
      ),
    );
  }
}
