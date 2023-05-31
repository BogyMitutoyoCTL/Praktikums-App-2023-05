// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class ZufallsErgebnis extends StatelessWidget {
  const ZufallsErgebnis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Entscheidungshilfe", style: TextStyle(
          fontSize: 20
        )),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: Center(
          child: Text("Lorem ipsum", style: Theme.of(context).textTheme.displayLarge),      //TODO Zufallsergebnis hier anzeigen
      )
    );
  }
}
