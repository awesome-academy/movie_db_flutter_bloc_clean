// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// Project imports:
import '/src/core/utils/extensions/dimension.dart';
import '/src/core/utils/gen/colors.gen.dart';
import '/src/presentation/home/bloc/home_bloc.dart';
import '/src/presentation/widgets/shimmer.dart';

class UpcomingText extends StatelessWidget {
  UpcomingText({
    required this.pageOffset,
    super.key,
  });

  final double? pageOffset;
  final df = new DateFormat('dd/MM/yyyy');
  final double paddingLeft = 30;
  final double titleTextSize = 20;
  final double contentTextSize = 14;

  @override
  Widget build(BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          current.upcomingStatus == NetworkDataStatus.success ||
          current.upcomingStatus == NetworkDataStatus.loading,
      builder: (context, state) {
        if (state.upcomingStatus == NetworkDataStatus.loading) {
          return buildShimmerUpcomingText(context);
        }
        final _list = state.upcomingData ?? [];
        final index = (pageOffset ?? 0).round();
        if (_list.length > index) {
          final dateRelease = df.format(
            _list[index].releaseDate ?? DateTime.now(),
          );
          return Padding(
            padding: EdgeInsets.only(left: paddingLeft),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${_list[index].title}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: titleTextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  dateRelease,
                  style: TextStyle(
                    color: ColorName.tabbarTextColorDisable,
                    fontSize: contentTextSize,
                  ),
                ),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      });

  Widget buildShimmerUpcomingText(BuildContext context) {
    final double widthTitle = Dimensions.screenWidth(context) * .5;
    final double widthContent = Dimensions.screenWidth(context) * .2;
    const double heightTitle = 20;
    const double heightContent = 15;
    final BorderRadius borderRadius = BorderRadius.circular(5);
    return Padding(
      padding: EdgeInsets.only(left: paddingLeft),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RectangleShimmer(
            borderRadius: borderRadius,
            width: widthTitle,
            height: heightTitle,
          ),
          const SizedBox(height: 3),
          RectangleShimmer(
            borderRadius: borderRadius,
            width: widthContent,
            height: heightContent,
          ),
        ],
      ),
    );
  }
}
