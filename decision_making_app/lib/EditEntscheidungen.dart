// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class EditEntscheidungen extends StatefulWidget {
  const EditEntscheidungen({Key? key}) : super(key: key);

  @override
  State<EditEntscheidungen> createState() => _EditEntscheidungenState();
}

class _EditEntscheidungenState extends State<EditEntscheidungen> {
  final List<TextEditingController> _controller = [];
  List<String> _text = [];

  _EditEntscheidungenState() {
    for (int i = 0; i < 10; i++) {
      _text.add("Lorem ipsum");

      _controller.add(TextEditingController());
      _controller[i].text = _text[i];
      _controller[i].addListener(() {
        setState(() {
          _text[i] = _controller[i].text;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<TextField> _Textfelder = [];
    for (TextEditingController _controller in _controller) {
      _Textfelder.add(TextField(
        controller: _controller,
        style: Theme.of(context).textTheme.displaySmall,
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
    );
  }
}
