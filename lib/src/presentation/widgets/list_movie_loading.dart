// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// Project imports:
import '/src/presentation/widgets/shimmer.dart';

class ListMovieLoading extends StatelessWidget {
  const ListMovieLoading({
    required this.count,
    this.isExpaded = false,
    super.key,
  });

  final int count;

  final bool isExpaded;

  @override
  Widget build(BuildContext context) {
    if (isExpaded) {
      return Expanded(
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
    }
    return StaggeredGrid.count(
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
    );
  }
}
