import 'package:decision_making_app/Entscheidung.dart';
import 'package:decision_making_app/main.dart';
import 'package:flutter/material.dart';

class EditOptionen extends StatefulWidget {
  const EditOptionen({Key? key}) : super(key: key);

  @override
  State<EditOptionen> createState() => _EditOptionenState();
}

class _EditOptionenState extends State<EditOptionen> {
  final List<TextEditingController> _controller = [];
  List<String> _text = [];

  _EditOptionenState() {
    var kochen = datenbank.entscheidungen[0];
    for (int i = 0; i < kochen.optionen.length; i++) {
      //_text.add("Lorem ipsum 2");
      TextEditingController controller;
      var textEditingController = TextEditingController();
      _controller.add(textEditingController);
      textEditingController.text = kochen.optionen[i];
      textEditingController.addListener(() {
        setState(() {
          kochen.optionen[i] = textEditingController.text;
        });
      });
    }
  }

  //TODO Dispose -> maybe bei "onDelete"

  @override
  Widget build(BuildContext context) {
    String optionName = "";
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
      appBar: AppBar(
        title: Center(
          child: Text(optionName),
        ),
      ),
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

  void onDelete() {
    var kochen = datenbank.entscheidungen[0];
    for (var option in kochen.optionen) {
      print(option);
    }
  }
}
