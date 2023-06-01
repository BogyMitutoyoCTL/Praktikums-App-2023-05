import 'package:decision_making_app/Entscheidung.dart';
import 'package:decision_making_app/Option.dart';
import 'package:decision_making_app/main.dart';
import 'package:flutter/material.dart';
import 'package:decision_making_app/ControllerUndOptionen.dart';

class EditOptionen extends StatefulWidget {
  final Entscheidung title;

  const EditOptionen(this.title, {Key? key}) : super(key: key);

  @override
  State<EditOptionen> createState() => _EditOptionenState();
}

class _EditOptionenState extends State<EditOptionen> {
  final List<ControllerUndOptionen> controllers = [];

  //TODO Dispose -> maybe bei "onDelete"

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    String optionName = "";
    final List<Widget> _Textfelder = [];
    for (ControllerUndOptionen _controller in controllers) {
      _Textfelder.add(Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller.controller,
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

  void onDelete(ControllerUndOptionen controller) {
    controllers.remove(controller);
    setState(() {});
  }

  void plus() {
    //TODO Add Button
  }
}
