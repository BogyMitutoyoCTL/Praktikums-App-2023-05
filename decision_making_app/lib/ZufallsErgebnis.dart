// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ZufallsErgebnis extends StatelessWidget {
  const ZufallsErgebnis(
    String frage, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("frage"),
          ),
        ),
        body: Center(
          child: Text("Lorem ipsum",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge), //TODO Zufallsergebnis hier anzeigen
        ));
  }
}
