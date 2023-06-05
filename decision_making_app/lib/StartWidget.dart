import 'dart:async';
import 'package:decision_making_app/EditEntscheidungen.dart';
import 'package:decision_making_app/Entscheidung.dart';
import 'package:decision_making_app/ZufallsErgebnis.dart';
import 'package:decision_making_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StartWidget extends StatefulWidget {
  const StartWidget({Key? key}) : super(key: key);

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
        floatingActionButton: FloatingActionButton(
            onPressed: changeLanguage,
            backgroundColor: Colors.white,
            child: const Icon(Icons.language)),
      ),
    );
  }

  void zufaelligesErgebnis(
      List<Widget> buttons, String frage, Entscheidung optionen) {
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

  void changeLanguage() {}
}
