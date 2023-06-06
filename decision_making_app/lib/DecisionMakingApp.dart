import 'package:decision_making_app/SplashScreen.dart';
import 'package:decision_making_app/StartWidget.dart';
import 'package:decision_making_app/storeFiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'main.dart';

class DecisionMakingApp extends StatefulWidget {
  const DecisionMakingApp({super.key});

  @override
  State<DecisionMakingApp> createState() => _DecisionMakingAppState();
}

class _DecisionMakingAppState extends State<DecisionMakingApp>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    await ensureIsSaved();
    super.dispose();
  }

  late Future<void>? writingDatabase;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.inactive) {
      // The app is deactivated and will probably be paused next
      // Let's store the data before it's too late.
      print("New lifecycle state: ${state.name}. Saving the database.");
      writingDatabase = StoreFiles().writeData(datenbank);
    } else if (state == AppLifecycleState.resumed) {
      print(
          "New lifecycle state: ${state.name}. Make sure that we have saved.");
      await ensureIsSaved();
    } else {
      print("New lifecycle state: ${state.name}.");
    }
  }

  Future<void> ensureIsSaved() async {
    if (writingDatabase != null) {
      await writingDatabase;
      writingDatabase = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color schriftfarbe = Colors.white;
    return MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        title: 'Decision Maker',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: AppBarTheme(backgroundColor: Colors.black26,
                titleTextStyle: TextStyle(fontSize: 20, color: schriftfarbe)),
            colorScheme: ColorScheme.dark(),
            textTheme: TextTheme(
                displayLarge: TextStyle(fontSize: 28,
                    color: schriftfarbe,
                    fontWeight: FontWeight.bold),
                displayMedium: TextStyle(fontSize: 20, color: schriftfarbe),
                displaySmall: TextStyle(fontSize: 15, color: schriftfarbe))),
        home: SplashScreen(),
        routes: {
          '/start': (context) => StartWidget()
        }
    );
  }
}
