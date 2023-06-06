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
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    timer = Timer(Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StartWidget(),
        ),
      );
    });
    timer?.cancel();
    return Scaffold(
      body: Center(
          child: Row(
        children: [
          Icon(
            Icons.shuffle_sharp,
            size: 100,
          ),
          Text(AppLocalizations.of(context)!.appTitel),
        ],
      )),
    );
  }
}
