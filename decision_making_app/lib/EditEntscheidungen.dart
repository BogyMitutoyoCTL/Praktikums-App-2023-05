// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class EditEntscheidungen extends StatefulWidget {
  const EditEntscheidungen({Key? key}) : super(key: key);

  @override
  State<EditEntscheidungen> createState() => _EditEntscheidungenState();
}

class _EditEntscheidungenState extends State<EditEntscheidungen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Entscheidungen" )
        )
      ),
      body: Placeholder(),
    );
  }
}
