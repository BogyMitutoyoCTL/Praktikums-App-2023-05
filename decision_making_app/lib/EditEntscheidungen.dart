import 'package:decision_making_app/Datenbank.dart';
import 'package:decision_making_app/Entscheidung.dart';
import 'package:flutter/material.dart';
import 'package:decision_making_app/Controller.dart';

import 'main.dart';

class EditEntscheidungen extends StatefulWidget {
  const EditEntscheidungen({Key? key}) : super(key: key);

  @override
  State<EditEntscheidungen> createState() => _EditEntscheidungenState();
}

class _EditEntscheidungenState extends State<EditEntscheidungen> {
  final List<ControllerUndEntscheidung> controllers = [];

  _EditEntscheidungenState() {
    for (Entscheidung entscheidung in datenbank.entscheidungen) {
      ControllerUndEntscheidung CuE = ControllerUndEntscheidung();
      controllers.add(CuE);
      CuE.entscheidung = entscheidung;
      CuE.controller.text = CuE.entscheidung.fragestellung;
      CuE.controller.addListener(() {
        setState(() {
          CuE.entscheidung.fragestellung = CuE.controller.text;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _Textfelder = [];
    for (ControllerUndEntscheidung con in controllers) {
      var loeschen = () => onDelete(con);
      _Textfelder.add(Row(
        children: [
          Expanded(
            child: TextField(
              controller: con.controller,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          IconButton(onPressed: loeschen, icon: Icon(Icons.delete))
        ],
      ));
    }

    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Entscheidungen"))),
      body: Center(
          child: Padding(
              padding: EdgeInsets.all(15),
              child: Scrollbar(
                thumbVisibility: true,
                child: ListView(
                  children: _Textfelder,
                ),
              ))),
      floatingActionButton: IconButton(
        onPressed: plus,
        icon: Icon(Icons.add),
      ),
    );
  }

  void onDelete(ControllerUndEntscheidung con) {
    setState(() {
      controllers.remove(con);
      datenbank.entscheidungen.remove(con.entscheidung);
      con.controller.dispose();
    });
  }

  void plus() {
    var entscheidung = datenbank.add("");
    setState(() {
      ControllerUndEntscheidung CuS = ControllerUndEntscheidung();
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
}
