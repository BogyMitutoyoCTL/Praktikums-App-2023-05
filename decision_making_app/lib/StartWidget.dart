import 'dart:async';
import 'package:decision_making_app/EditEntscheidungen.dart';
import 'package:decision_making_app/Entscheidung.dart';
import 'package:decision_making_app/OnlineJsonToOwnFormat.dart';
import 'package:decision_making_app/ZufallsErgebnis.dart';
import 'package:decision_making_app/main.dart';
import 'package:decision_making_app/storeFiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:decision_making_app/AboutWidget.dart';

import 'UploadToCloud.dart';

var speichern = StoreFiles();

class StartWidget extends StatefulWidget {
  StartWidget({Key? key}) : super(key: key) {}

  @override
  State<StartWidget> createState() => _StartWidgetState();
}

class _StartWidgetState extends State<StartWidget> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(AppLocalizations.of(context)!.meldung),
            content: Text(AppLocalizations.of(context)!.exit),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(AppLocalizations.of(context)!.no),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(AppLocalizations.of(context)!.yes),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    test();
    List<Widget> mainButtons = [];
    for (int i = 0; i < datenbank.entscheidungen.length; i++) {
      var frage = datenbank.entscheidungen[i].fragestellung;
      mainButtons.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.white,
            child: MaterialButton(
              onPressed: () {
                zufaelligesErgebnis(
                    mainButtons, frage, datenbank.entscheidungen[i]);
              },
              textColor: Colors.black,
              child: Text(frage),
            ),
          ),
        ),
      );
    }
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          //backgroundColor: Colors.black12,
          title: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: toAbout, icon: Icon(Icons.question_mark)),
                  Expanded(
                      child: Center(
                          child: Text(AppLocalizations.of(context)!.mainPage))),
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
              children: mainButtons,
            ),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                heroTag: null,
                onPressed: getFromCloud,
                backgroundColor: Colors.white,
                child: const Icon(Icons.cloud_download_outlined)),
            SizedBox(height: 20),
            FloatingActionButton(
              heroTag: null,
              onPressed: saveToCloud,
              backgroundColor: Colors.white,
              child: const Icon(Icons.cloud_upload_outlined),
            )
          ],
        ),
      ),
    );
  }

  void zufaelligesErgebnis(
      List<Widget> buttons, String frage, Entscheidung optionen) {
    Navigator.of(context)
        .push(MaterialPageRoute(
            builder: (context) => ZufallsErgebnis(frage, optionen)))
        .then(refresh);
  }

  void bearbeiten() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => EditEntscheidungen()))
        .then(refresh);
  }

  void toAbout() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AboutWidget()))
        .then(refresh);
  }

  FutureOr refresh(value) {
    setState(() {
      datenbank.deleteDuplicateOptions();
      datenbank.deleteEmptyOptions();
      test();
    });
  }

  void test() {
    for (int i = 0; i < datenbank.entscheidungen.length; i++) {
      if (datenbank.entscheidungen[i].fragestellung == "") {
        var temp = datenbank.entscheidungen[i];
        if (temp.optionen.isEmpty) {
          datenbank.entscheidungen.remove(temp);
        }
      }
    }
  }

  Future<void> save() async {
    await speichern.writeData(datenbank);
  }

  Future<void> getFromCloud() async {
    await OnlineJsonToOwnFormat().getData();
    setState(() {});
  }

  Future<void> saveToCloud() async {
    await UploadToCloud().uploadData();
  }
}
