// ignore_for_file: prefer_const_constructors

import 'package:decision_making_app/Entscheidung.dart';
import 'package:decision_making_app/Option.dart';
import 'package:flutter/material.dart';

class ZufallsErgebnis extends StatelessWidget {
  final String frage;
  final Entscheidung entscheidungen;

  const ZufallsErgebnis(
    String this.frage,
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
        child: Text("Lorem ipsum",
            style: Theme.of(context)
                .textTheme
                .displayLarge), //TODO Zufallsergebnis hier anzeigen
      ),
      floatingActionButton: IconButton(onPressed: test, icon: Icon(Icons.add)),
    );
  }

  void test() {
    print(entscheidungen);
  }
}
