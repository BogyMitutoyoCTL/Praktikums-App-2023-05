import 'package:decision_making_app/Datenbank.dart';
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
      var inhalt = datenbank.entscheidungen[i].fragestellung;
      buttons.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.white,
            child: MaterialButton(
              onPressed: zufall,
              textColor: Colors.black,
              child: Text(inhalt),
            ),
          ),
        ),
      );
    }
    //TODO Inhalte in Buttons
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.black12,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("Entscheidungshilfe"),
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

  zufall() {
    //TODO Tastendruck
  }
//TODO mit Lambdas Tastendruck machen
}
