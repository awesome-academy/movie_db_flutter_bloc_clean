// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          iconData: CupertinoIcons.bookmark)
    ];
