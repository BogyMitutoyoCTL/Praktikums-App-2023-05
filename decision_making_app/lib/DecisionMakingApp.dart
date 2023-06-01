import 'package:flutter/material.dart';

import 'StartWidget.dart';

class DecisionMakingApp extends StatelessWidget {
  const DecisionMakingApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color schriftfarbe = Colors.white;
    return MaterialApp(
      title: 'Decision Maker',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
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
