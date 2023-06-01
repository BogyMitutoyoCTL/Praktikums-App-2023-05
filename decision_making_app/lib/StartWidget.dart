import 'dart:async';

import 'package:decision_making_app/Datenbank.dart';
import 'package:decision_making_app/EditEntscheidungen.dart';
import 'package:decision_making_app/Entscheidung.dart';
import 'package:decision_making_app/ZufallsErgebnis.dart';
import 'package:decision_making_app/main.dart';
import 'package:flutter/material.dart';

class StartWidget extends StatefulWidget {
  const StartWidget({Key? key}) : super(key: key);

  @override
  State<StartWidget> createState() => _StartWidgetState();
}

class _StartWidgetState extends State<StartWidget> {
  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [];
    for (int i = 0; i < datenbank.entscheidungen.length; i++) {
      var frage = datenbank.entscheidungen[i].fragestellung;
      buttons.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.white,
            child: MaterialButton(
              onPressed: () {
                zufall(buttons, frage, datenbank.entscheidungen[i]);
              },
              textColor: Colors.black,
              child: Text(frage),
            ),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.black12,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(child: Center(child: Text("Entscheidungshilfe"))),
                IconButton(onPressed: bearbeiten, icon: Icon(Icons.edit)),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Scrollbar(
          thumbVisibility: true,
          child: ListView(
            children: buttons,
          ),
        ),
      ),

      //backgroundColor: Colors.black26,
    );
  }

  void zufall(List<Widget> buttons, String frage, Entscheidung optionen) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ZufallsErgebnis(frage, optionen)));
  }

  void bearbeiten() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => EditEntscheidungen()))
        .then(refresh);
  }

  FutureOr refresh(value) {
    setState(() {});
  }
}
