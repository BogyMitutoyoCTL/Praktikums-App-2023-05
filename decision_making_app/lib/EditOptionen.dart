import 'package:decision_making_app/Entscheidung.dart';
import 'package:decision_making_app/Option.dart';
import 'package:decision_making_app/main.dart';
import 'package:flutter/material.dart';
import 'package:decision_making_app/ControllerUndOptionen.dart';

class EditOptionen extends StatefulWidget {
  Entscheidung title;

  EditOptionen(this.title, {Key? key}) : super(key: key);

  @override
  State<EditOptionen> createState() => _EditOptionenState();
}

class _EditOptionenState extends State<EditOptionen> {
  final List<ControllerUndOptionen> controllers = [];

  _EditOptionenState() {
    for (Option option in widget.title.optionen) {
      ControllerUndOptionen CuO = ControllerUndOptionen();
      controllers.add(CuO);
      CuO.entscheidung = widget.title;
      CuO.controller.text = option.text;
      setState(() {
        option.text = CuO.controller.text;
      });
    }
  }

  //TODO Dispose -> maybe bei "onDelete"

  @override
  Widget build(BuildContext context) {
    String optionName = "";
    final List<Widget> _Textfelder = [];
    for (TextEditingController _controller in _controllers) {
      _Textfelder.add(Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          IconButton(
              onPressed: () {
                onDelete(_controller);
              },
              icon: Icon(Icons.delete))
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
      floatingActionButton: IconButton(onPressed: plus, icon: Icon(Icons.add)),
    );
  }

  void onDelete(TextEditingController _controller) {
    _controllers.remove(_controller);
    setState(() {});
  }

  void plus() {
    //TODO Add Button
  }
}
