import 'package:decision_making_app/Datenbank.dart';
import 'package:decision_making_app/EditOptionen.dart';
import 'package:decision_making_app/Entscheidung.dart';
import 'package:decision_making_app/StartWidget.dart';
import 'package:flutter/material.dart';
import 'package:decision_making_app/Controller.dart';

import 'main.dart';

class EditEntscheidungen extends StatefulWidget {
  const EditEntscheidungen({Key? key}) : super(key: key);

  @override
  State<EditEntscheidungen> createState() => _EditEntscheidungenState();
}

class _EditEntscheidungenState extends State<EditEntscheidungen> {
  final List<ControllerUndString> controllers = [];

  _EditEntscheidungenState() {
    for (Entscheidung entscheidung in datenbank.entscheidungen) {
      ControllerUndString CuE = ControllerUndString();
      controllers.add(CuE);
      CuE.entscheidung = entscheidung;
      CuE.controller.text = CuE.entscheidung.fragestellung;
      CuE.controller.addListener(() {
        setState(() {
          CuS.entscheidung.fragestellung = CuS.controller.text;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _Textfelder = [];
    for (ControllerUndString con in controllers) {
      var loeschen = () => onDelete(con);
      _Textfelder.add(Row(
        children: [
          Expanded(
            child: TextField(
              controller: con.controller,
              style: Theme
                  .of(context)
                  .textTheme
                  .displaySmall,
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    bearbeiten(con.entscheidung);
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
              Expanded(child: Center(child: Text("Entscheidungen"))),
              IconButton(onPressed: home, icon: Icon(Icons.home)),
            ],
          )),
      body: Center(
          child: Padding(
              padding: EdgeInsets.all(15),
              child: Scrollbar(
                thumbVisibility: true,
                child: ListView(
                  children: _Textfelder,
                ),
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: plus,

        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }

  void onDelete(ControllerUndString con) {
    setState(() {
      controllers.remove(con);
      datenbank.entscheidungen.remove(con.entscheidung);
      con.controller.dispose();
    });
  }

  void plus() {
    var entscheidung = datenbank.add("");
    setState(() {
      ControllerUndString CuS = ControllerUndString();
      controllers.add(CuS);
      CuS.entscheidung = entscheidung;
      CuS.controller.text = CuS.entscheidung.fragestellung;
      CuS.controller.addListener(() {
        setState(() {
          CuS.entscheidung.fragestellung = CuS.controller.text;
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
