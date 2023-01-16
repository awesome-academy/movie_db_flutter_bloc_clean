// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:movie_db_flutter_bloc_clean/src/presentation/blocs/app_setting/app_setting_bloc.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(final Widget widget) => pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<AppSettingBloc>(
            create: (BuildContext context) => AppSettingBloc(),
          ),
        ],
        child: BlocBuilder<AppSettingBloc, AppSettingState>(
          builder: (context, state) => MaterialApp(
            title: 'Movie DB',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: Colors.black,
            ),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'), // English
              Locale('vi'), // Vietnamese
            ],
            locale:
                context.watch<AppSettingBloc>().state.language == Language.vi
                    ? const Locale('vi')
                    : const Locale('en'),
            debugShowCheckedModeBanner: false,
            home: widget,
          ),
        ),
      ));
}
