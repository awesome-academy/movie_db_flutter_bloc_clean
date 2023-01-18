// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// Project imports:
import '/src/core/utils/gen/colors.gen.dart';
import 'shimmer.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    required this.path,
    required this.description,
    required this.title,
    super.key,
  });

  final String path;
  final String title;
  final Widget description;

  @override
  Widget build(BuildContext context) {
    final url = 'https://image.tmdb.org/t/p/w500$path';
    return StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 3,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            top: 0,
            left: 0,
            right: 0,
            child: CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
              placeholder: (context, url) => const RectangleShimmer(),
              errorWidget: (context, url, error) => const Center(
                child: Icon(Icons.error),
              ),
            ),
          ),
          buildGradient(),
          buildContent(title)
        ],
      ),
    );
  }

  Widget buildContent(String? title) => Positioned(
        bottom: 5,
        left: 5,
        right: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title',
              style: const TextStyle(color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            description,
          ],
        ),
      );

  Widget buildGradient() {
    final LinearGradient appBarLinear = LinearGradient(
      colors: [
        Colors.transparent,
        ColorName.tabbarColor.withOpacity(.1),
        Colors.black.withOpacity(.6),
      ],
      stops: const [0.0, 0.7, 1.0],
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      tileMode: TileMode.repeated,
    );
    return Positioned(
      bottom: 0,
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(gradient: appBarLinear),
      ),
    );
  }
}
