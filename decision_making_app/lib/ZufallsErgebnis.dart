import 'dart:math';
import 'package:decision_making_app/Entscheidung.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ZufallsErgebnis extends StatelessWidget {
  final String frage;
  final Entscheidung entscheidung;

  const ZufallsErgebnis(
    this.frage,
    this.entscheidung, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(frage),
      )),
      body: Center(
        child: Text(
          zufallsergebnis(context),
          style: Theme.of(context).textTheme.displayLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  String zufallsergebnis(BuildContext context) {
    var laenge = entscheidung.optionen.length;
    if (laenge == 0) {
      return AppLocalizations.of(context)!.noOption;
    }
    if (laenge == 1) {
      String ausgabe = AppLocalizations.of(context)!.oneOption +
          entscheidung.optionen[0].toString();
      return ausgabe;
    }
    Random random = Random();
    int randomNumber = random.nextInt(laenge); //from 0 to laenge-1
    String ergebnis = entscheidung.optionen[randomNumber].toString();
    return ergebnis;
  }
}
