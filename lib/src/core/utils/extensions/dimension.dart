// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/cupertino.dart';

class Dimensions {
  Dimensions._();

  static const double guidelineBaseWidth = 375;
  static const double guidelineBaseHeight = 812;

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double scaleWidth(BuildContext context) =>
      screenWidth(context) / guidelineBaseWidth;
  static double scaleHeight(BuildContext context) =>
      screenHeight(context) / guidelineBaseHeight;

  static double scaleText(BuildContext context) =>
      min(scaleWidth(context), scaleHeight(context));
}

extension ScreenExtension on num {
  double w(BuildContext context) =>
      this * Dimensions.scaleWidth(context); // Width Scale
  double h(BuildContext context) =>
      this * Dimensions.scaleHeight(context); // Height Scale
  double t(BuildContext context) =>
      this * Dimensions.scaleText(context); // Text Scale
  double r(BuildContext context) =>
      this * Dimensions.scaleText(context); // Radius Scale
}
