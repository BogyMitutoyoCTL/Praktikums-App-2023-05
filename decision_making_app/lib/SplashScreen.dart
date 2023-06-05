import 'dart:async';
import 'package:decision_making_app/EditEntscheidungen.dart';
import 'package:decision_making_app/Entscheidung.dart';
import 'package:decision_making_app/StartWidget.dart';
import 'package:decision_making_app/ZufallsErgebnis.dart';
import 'package:decision_making_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TextButton(
            //TODO change normal and buttons background color
            onPressed: weiter,
            backgroundcolor: Colors.white,
            child: Text(AppLocalizations.of(context)!.pressToContinue)));
  }

  void weiter() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => StartWidget()));
  }
}
