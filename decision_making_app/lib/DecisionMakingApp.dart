import 'package:decision_making_app/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'StartWidget.dart';

class DecisionMakingApp extends StatelessWidget {
  const DecisionMakingApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color schriftfarbe = Colors.white;
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Decision Maker',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.black26,
              titleTextStyle: TextStyle(fontSize: 20, color: schriftfarbe)),
          colorScheme: ColorScheme.dark(),
          textTheme: TextTheme(
              displayLarge: TextStyle(
                  fontSize: 28,
                  color: schriftfarbe,
                  fontWeight: FontWeight.bold),
              displayMedium: TextStyle(fontSize: 20, color: schriftfarbe),
              displaySmall: TextStyle(fontSize: 15, color: schriftfarbe))),
      home: SplashScreen(),
    );
  }
}
