import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:decision_making_app/EditOptionen.dart';
import 'package:decision_making_app/Entscheidung.dart';
import 'package:decision_making_app/StartWidget.dart';
import 'package:flutter/material.dart';
import 'package:decision_making_app/ControllerUndEntscheidung.dart';

import 'main.dart';

class EditEntscheidungen extends StatefulWidget {
  const EditEntscheidungen({Key? key}) : super(key: key);

  @override
  State<EditEntscheidungen> createState() => _EditEntscheidungenState();
}

class _EditEntscheidungenState extends State<EditEntscheidungen> {
  final List<ControllerUndEntscheidung> controllerUndEntscheidung = [];

  _EditEntscheidungenState() {
    for (Entscheidung entscheidung in datenbank.entscheidungen) {
      ControllerUndEntscheidung textontrollerUndEntscheidung =
          ControllerUndEntscheidung();
      controllerUndEntscheidung.add(textontrollerUndEntscheidung);
      textontrollerUndEntscheidung.entscheidung = entscheidung;
      textontrollerUndEntscheidung.controller.text =
          textontrollerUndEntscheidung.entscheidung.fragestellung;
      textontrollerUndEntscheidung.controller.addListener(() {
        setState(() {
          textontrollerUndEntscheidung.entscheidung.fragestellung =
              textontrollerUndEntscheidung.controller.text;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> textfelder = [];
    for (ControllerUndEntscheidung controlUndEntscheidung
        in controllerUndEntscheidung) {
      var loeschen = () => onDelete(controlUndEntscheidung);
      textfelder.add(Row(
        children: [
          Expanded(
            child: TextField(
              controller: controlUndEntscheidung.controller,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    bearbeiten(controlUndEntscheidung.entscheidung);
                  },
                  icon: Icon(Icons.edit)),
              IconButton(onPressed: loeschen, icon: Icon(Icons.delete))
            ],
          )
        ],
      ));
    }

    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Expanded(
              child:
                  Center(child: Text(AppLocalizations.of(context)!.decisions))),
          IconButton(onPressed: home, icon: Icon(Icons.home)),
        ],
      )),
      body: Center(
          child: Padding(
              padding: EdgeInsets.all(15),
              child: Scrollbar(
                thumbVisibility: true,
                child: ListView(
                  children: textfelder,
                ),
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: plus,
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }

  void onDelete(ControllerUndEntscheidung controlUndEntscheidung) {
    setState(() {
      datenbank.entscheidungen.remove(controlUndEntscheidung.entscheidung);

      controllerUndEntscheidung.remove(controlUndEntscheidung);
      controlUndEntscheidung.controller.dispose();
    });
  }

  void plus() {
    var neueEntscheidung = datenbank.add("");
    setState(() {
      ControllerUndEntscheidung controlUndEntscheidung =
          ControllerUndEntscheidung();
      controllerUndEntscheidung.add(controlUndEntscheidung);
      controlUndEntscheidung.entscheidung = neueEntscheidung;
      controlUndEntscheidung.controller.text =
          controlUndEntscheidung.entscheidung.fragestellung;
      controlUndEntscheidung.controller.addListener(() {
        setState(() {
          controlUndEntscheidung.entscheidung.fragestellung =
              controlUndEntscheidung.controller.text;
        });
      });
    });
  }

  void home() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => StartWidget()));
  }

  void bearbeiten(Entscheidung aktuelleEntscheidung) {
    print(aktuelleEntscheidung);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => EditOptionen(aktuelleEntscheidung)));
  }
}
