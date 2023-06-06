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
    String ergebnis = "";
    while (ergebnis == "") {
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
      ergebnis = entscheidung.optionen[randomNumber].toString();

      if (ergebnis == "") {
        int wdh = 0;
        int possible = 0;
        for (int i = 0; i <= entscheidung.optionen.length - 1; i++) {
          if (entscheidung.optionen[i].toString() == "") {
            wdh++;
          } else {
            possible++;
          }
        }
        print("da");
        if (wdh == entscheidung.optionen.length) {
          print("Text ausgabe");
          return AppLocalizations.of(context)!.onlyEmpty;
        }
      }
    }
    return ergebnis;
  }
}
