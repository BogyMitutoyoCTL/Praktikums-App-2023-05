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
        backgroundColor: Colors.black26,
      ),
      body: Center(
          child: Text("Lorem ipsum", style: TextStyle(
            fontSize: 28,
            color: Colors.white
          )),      //TODO Zufallsergebnis hier anzeigen
      )
    );
  }
}
