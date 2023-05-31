import 'package:decision_making_app/Datenbank.dart';
import 'package:decision_making_app/Entscheidung.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class EditEntscheidungen extends StatefulWidget {
  const EditEntscheidungen({Key? key}) : super(key: key);

  @override
  State<EditEntscheidungen> createState() => _EditEntscheidungenState();
}

class _EditEntscheidungenState extends State<EditEntscheidungen> {
  final List<TextEditingController> _controller = [];
  final List<String> _text = [];

  _EditEntscheidungenState() {
    for (Entscheidung entscheidung in datenbank.entscheidungen) {
      String text = entscheidung.fragestellung;
      _text.add(text);
      TextEditingController controller = TextEditingController();
      _controller.add(controller);
      controller.text = text;
      controller.addListener(() {
        setState(() {
          text = controller.text;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _Textfelder = [];
    for (TextEditingController _controller in _controller) {
      _Textfelder.add(Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          IconButton(onPressed: onDelete, icon: Icon(Icons.delete))
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

  void onDelete() {}

  void plus() {}
}
