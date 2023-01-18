// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Project imports:
import 'list_movie_loading.dart';

class HasMoreData extends StatelessWidget {
  const HasMoreData({required this.hasMore, this.height = 100, super.key});

  final bool hasMore;

  final double height;

  @override
  Widget build(BuildContext context) {
    if (hasMore) {
      return const ListMovieLoading(count: 2);
    } else {
      return Container(
        height: height,
        child: Center(
          child: Text(
            AppLocalizations.of(context).noMoreData,
          ),
        ),
      );
    }
  }
}
