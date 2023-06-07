import 'dart:math';
import 'package:decision_making_app/Entscheidung.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ZufallsErgebnis extends StatefulWidget {
  final String frage;
  final Entscheidung entscheidung;

  const ZufallsErgebnis(this.frage,
      this.entscheidung, {
        Key? key,
      }) : super(key: key);

  @override
  State<ZufallsErgebnis> createState() => _ZufallsErgebnisState();
}

class _ZufallsErgebnisState extends State<ZufallsErgebnis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                widget.frage,
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                zufallsergebnis(context),
                style: Theme
                    .of(context)
                    .textTheme
                    .displayLarge,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: reroll,
                  style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: Text(
                    AppLocalizations.of(context)!.reroll,
                    style: TextStyle(fontSize: 20, color: Colors.black),

                  )),
            )
          ],
        ),
      ),
    );
  }

  String zufallsergebnis(BuildContext context) {
    var laenge = widget.entscheidung.optionen.length;
    String ergebnis = "";
    int possible = 0;
    while (ergebnis == "") {
      if (laenge == 0) {
        return AppLocalizations.of(context)!.noOption;
      }
      if (laenge == 1) {
        String ausgabe = AppLocalizations.of(context)!.oneOption +
            widget.entscheidung.optionen[0].toString();
        return ausgabe;
      }
      Random random = Random();
      int randomNumber = random.nextInt(laenge); //from 0 to laenge-1
      ergebnis = widget.entscheidung.optionen[randomNumber].toString();

      if (ergebnis == "") {
        int wdh = 0;

        for (int i = 0; i <= widget.entscheidung.optionen.length - 1; i++) {
          if (widget.entscheidung.optionen[i].toString() == "") {
            wdh++;
          } else {
            possible++;
          }
        }
        if (wdh == widget.entscheidung.optionen.length) {
          return AppLocalizations.of(context)!.onlyEmpty;
        }
      }
    }
    if (possible == 1) {
      return AppLocalizations.of(context)!.oneOption + ergebnis;
    }
    return ergebnis;
  }

  void reroll() {
    setState(() {});
  }
}
