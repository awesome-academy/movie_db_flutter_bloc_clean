// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '/src/core/utils/extensions/dimension.dart';
import '/src/presentation/home/bloc/home_bloc.dart';
import '/src/presentation/widgets/shimmer.dart';

class UpcomingImage extends StatelessWidget {
  const UpcomingImage({
    required this.pageOffset,
    required this.pageController,
    required this.viewportFraction,
    super.key,
  });

  final PageController? pageController;
  final double viewportFraction;
  final double? pageOffset;

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        height: Dimensions.screenHeight(context) * .6,
        child: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) =>
              current.upcomingStatus == NetworkDataStatus.success ||
              current.upcomingStatus == NetworkDataStatus.loading,
          builder: (context, state) {
            final _list = state.upcomingData ?? [];
            if (state.upcomingStatus == NetworkDataStatus.loading) {
              return buildShimmerUpcomingImage(context);
            }
            return PageView.builder(
              controller: pageController,
              itemBuilder: (context, index) {
                double scale = max(viewportFraction,
                    (1 - (pageOffset! - index).abs()) + viewportFraction);

                double angle = (pageOffset! - index).abs();

                if (angle > 0.5) {
                  angle = 1 - angle;
                }
                return Container(
                  padding: EdgeInsets.only(
                    right: 10,
                    left: 20,
                    top: 100 - scale * 25,
                    bottom: 50,
                  ),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(
                        3,
                        2,
                        0.001,
                      )
                      ..rotateY(angle),
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        buildImage(_list[index].posterPath, index, context),
                        Positioned(
                          bottom: 0,
                          left: 10,
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: _list.length,
            );
          },
        ),
      );

  Widget buildShimmerUpcomingImage(BuildContext context) {
    final width = Dimensions.screenHeight(context) * .4 * viewportFraction;
    final height = Dimensions.screenHeight(context) * .6 * viewportFraction;
    return Center(
      child: RectangleShimmer(
        width: width,
        height: height,
      ),
    );
  }

  Widget buildImage(String? path, int index, BuildContext context) {
    final url = 'https://image.tmdb.org/t/p/w500$path';
    return CachedNetworkImage(
      imageUrl: url,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
      alignment: Alignment((pageOffset! - index).abs() * 0.5, 0),
      placeholder: (context, url) => buildShimmerUpcomingImage(context),
      errorWidget: (context, url, error) => const Center(
        child: Icon(Icons.error),
      ),
    );
  }
}
