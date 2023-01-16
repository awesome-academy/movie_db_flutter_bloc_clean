// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '/src/core/utils/gen/assets.gen.dart';
import '/src/core/utils/gen/colors.gen.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({super.key});

  final LinearGradient appBarLinear = LinearGradient(
    colors: [
      ColorName.tabbarColor.withOpacity(.1),
      ColorName.primary.withOpacity(.1),
    ],
    stops: const [0.0, 1.0],
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
    tileMode: TileMode.repeated,
  );

  final double appBarHeight = 140;
  final double logoHeight = 40;
  final double logoWidth = 40;
  final double logoTextSize = 30;

  @override
  Widget build(BuildContext context) => Container(
        height: appBarHeight,
        decoration: BoxDecoration(gradient: appBarLinear),
        child: Column(
          children: [
            const Expanded(child: SizedBox.shrink()),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(width: 16),
                SizedBox(
                  height: logoHeight,
                  width: logoWidth,
                  child: Assets.icons.logo.svg(),
                ),
                const SizedBox(width: 10),
                Text(
                  'FILMAX',
                  style: TextStyle(color: Colors.white, fontSize: logoTextSize),
                )
              ],
            ),
            const SizedBox(height: 10)
          ],
        ),
      );
}
