// ignore_for_file: prefer_const_constructors
import 'dart:math';
import 'package:decision_making_app/Entscheidung.dart';
import 'package:decision_making_app/Option.dart';
import 'package:flutter/material.dart';

class ZufallsErgebnis extends StatelessWidget {
  final String frage;
  final Entscheidung entscheidungen;

  const ZufallsErgebnis(String this.frage,
      Entscheidung this.entscheidungen, {
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
        child: Text(zufallsergebnis(),
            style: Theme
                .of(context)
                .textTheme
                .displayLarge),
      ),
    );
  }

  String zufallsergebnis() {
    var laenge = entscheidungen.optionen.length;
    Random random = new Random();
    int randomNumber = random.nextInt(laenge); //from 0 to laenge-1
    String ergebnis = entscheidungen.optionen[randomNumber].toString();
    return ergebnis;
  }
}
