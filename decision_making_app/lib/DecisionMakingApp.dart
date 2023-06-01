import 'package:flutter/material.dart';

import 'StartWidget.dart';

class DecisionMakingApp extends StatelessWidget {
  const DecisionMakingApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color schriftfarbe = Colors.white;
    return MaterialApp(
      //   localizationsDelegates: AppLocalizations.LocalizationsDelegates,
      //    supportedLocales: AppLocalizations.supportLocales,
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
      home: StartWidget(),
    );
  }
}
