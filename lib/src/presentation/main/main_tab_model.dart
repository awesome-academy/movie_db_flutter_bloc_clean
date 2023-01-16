import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_db_flutter_bloc_clean/src/core/utils/gen/colors.gen.dart';

class TabModel {
  TabModel({
    required this.text,
    required this.iconData,
  });

  final String text;
  final IconData iconData;
}

List<TabModel> mainTabs(BuildContext context) => <TabModel>[
      TabModel(
          text: AppLocalizations.of(context).home,
          iconData: CupertinoIcons.home),
      TabModel(
          text: AppLocalizations.of(context).popular,
          iconData: CupertinoIcons.square_grid_2x2),
      TabModel(
          text: AppLocalizations.of(context).coming,
          iconData: CupertinoIcons.clock),
      TabModel(
          text: AppLocalizations.of(context).favorite,
          iconData: CupertinoIcons.heart)
    ];

List<Widget> mainViews(BuildContext context) => <Widget>[
      Scaffold(
        body: Center(
          child: Text(
            AppLocalizations.of(context).home,
            style: const TextStyle(color: ColorName.tabbarTextColorEnable),
          ),
        ),
      ),
      Scaffold(
        body: Center(
          child: Text(
            AppLocalizations.of(context).popular,
            style: const TextStyle(color: ColorName.tabbarTextColorEnable),
          ),
        ),
      ),
      Scaffold(
        body: Center(
          child: Text(
            AppLocalizations.of(context).coming,
            style: const TextStyle(color: ColorName.tabbarTextColorEnable),
          ),
        ),
      ),
      Scaffold(
        body: Center(
          child: Text(
            AppLocalizations.of(context).favorite,
            style: const TextStyle(color: ColorName.tabbarTextColorEnable),
          ),
        ),
      ),
    ];
