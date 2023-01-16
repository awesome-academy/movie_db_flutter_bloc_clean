// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shimmer/shimmer.dart';

class RectangleShimmer extends StatelessWidget {
  const RectangleShimmer({
    Key? key,
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    this.width,
    this.height,
    this.baseColor,
    this.highlightColor,
    this.loadingColor,
  }) : super(key: key);

  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final BoxShape shape;
  final Color? baseColor;
  final Color? highlightColor;
  final Color? loadingColor;

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: baseColor ?? Colors.grey.shade300,
        highlightColor: highlightColor ?? Colors.grey.shade100,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            shape: shape,
            color: loadingColor ?? Colors.grey,
          ),
        ),
      );
}
