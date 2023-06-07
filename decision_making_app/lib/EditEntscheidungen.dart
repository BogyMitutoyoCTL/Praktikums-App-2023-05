import 'dart:async';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:decision_making_app/EditOptionen.dart';
import 'package:decision_making_app/Entscheidung.dart';
import 'package:decision_making_app/StartWidget.dart';
import 'package:flutter/material.dart';
import 'package:decision_making_app/ControllerUndEntscheidung.dart';

import 'Option.dart';
import 'main.dart';

class EditEntscheidungen extends StatefulWidget {
  const EditEntscheidungen({Key? key}) : super(key: key);

  @override
  State<EditEntscheidungen> createState() => _EditEntscheidungenState();
}

class _EditEntscheidungenState extends State<EditEntscheidungen> {
  final List<ControllerUndEntscheidung> controllerUndEntscheidung = [];

  _EditEntscheidungenState() {
    if (datenbank.entscheidungen.isEmpty) datenbank.add("");
    for (Entscheidung entscheidung in datenbank.entscheidungen) {
      ControllerUndEntscheidung textcontrollerUndEntscheidung =
          ControllerUndEntscheidung();
      controllerUndEntscheidung.add(textcontrollerUndEntscheidung);
      textcontrollerUndEntscheidung.entscheidung = entscheidung;
      if (entscheidung.fragestellung == "") {
        textcontrollerUndEntscheidung.focusNode.requestFocus();
      }
      textcontrollerUndEntscheidung.controller.text =
          textcontrollerUndEntscheidung.entscheidung.fragestellung;
      textcontrollerUndEntscheidung.controller.addListener(() {
        setState(() {
          textcontrollerUndEntscheidung.entscheidung.fragestellung =
              textcontrollerUndEntscheidung.controller.text;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    datenbank.deleteEmptyOptions();
    datenbank.deleteDuplicateOptions();
    final List<Widget> textfelder = [];
    for (ControllerUndEntscheidung controlUndEntscheidung
        in controllerUndEntscheidung) {
      var loeschen = () => onDelete(controlUndEntscheidung);
      textfelder.add(Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: controlUndEntscheidung.focusNode,
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
    bool allow = true;
    for (int i = 0; i < controllerUndEntscheidung.length; i++) {
      if (controllerUndEntscheidung[i].entscheidung.fragestellung == "") {
        allow = false;
      }
    }
    if (allow == true) {
      var neueEntscheidung = datenbank.add("");
      setState(() {
        ControllerUndEntscheidung controlUndEntscheidung =
            ControllerUndEntscheidung();
        controllerUndEntscheidung.add(controlUndEntscheidung);
        controlUndEntscheidung.focusNode.requestFocus();
        controlUndEntscheidung.entscheidung = neueEntscheidung;
        controlUndEntscheidung.entscheidung.optionen.add(Option("Option 1"));
        controlUndEntscheidung.entscheidung.optionen.add(Option("Option 2"));
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
  }

  void home() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => StartWidget()));
  }

  void bearbeiten(Entscheidung aktuelleEntscheidung) {
    Navigator.of(context)
        .push(MaterialPageRoute(
            builder: (context) => EditOptionen(aktuelleEntscheidung)))
        .then(refresh);
  }

  FutureOr refresh(value) {
    setState(() {});
  }
}
