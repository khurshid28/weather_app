import 'package:app_for_test/blocs/weather/weatherBloc.dart';
import 'package:easy_localization/easy_localization.dart';

import './exportFiles.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: [
        Locale('uz', 'UZ'),
        Locale('ru', 'RU'),
      ],
      path: 'assets/languages',
      fallbackLocale: Locale('en', 'US'),
      child: ScreenUtilInit(
        // Iphone 11 pro size
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: providers,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates
                ..addAll(
                  [
                    GlobalWidgetsLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                ),
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              initialRoute: RouteNames.SplashView,
              onGenerateRoute: FullRoutes().ongenerateRoute,
              builder: MaterialAppCustomBuilder.builder,
              theme: ThemeData(
                fontFamily: 'Inter',
              ),
            ),
          );
        },
      ),
    );
  }
}

List<BlocProvider> providers = [
  BlocProvider<WeatherBloc>(
    create: (context) => WeatherBloc(),
    lazy: false,
  ),
];
