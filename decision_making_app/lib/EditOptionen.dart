import 'package:decision_making_app/Entscheidung.dart';
import 'package:decision_making_app/Option.dart';
import 'package:decision_making_app/main.dart';
import 'package:flutter/material.dart';
import 'package:decision_making_app/ControllerUndOption.dart';

class EditOptionen extends StatefulWidget {
  final Entscheidung entscheidung;

  const EditOptionen(this.entscheidung, {Key? key}) : super(key: key);

  @override
  State<EditOptionen> createState() => _EditOptionenState();
}

class _EditOptionenState extends State<EditOptionen> {
  final List<ControllerUndOption> controllers = [];

  @override
  void initState() {
    super.initState();
    for (Option option in widget.entscheidung.optionen) {
      ControllerUndOption CuO = ControllerUndOption();
      controllers.add(CuO);
      CuO.option = option;
      CuO.controller.text = option.text;
      CuO.controller.addListener(() {
        setState(() {
          option.text = CuO.controller.text;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String optionName = "";
    final List<Widget> _Textfelder = [];
    for (ControllerUndOption _controller in controllers) {
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

  void onDelete(ControllerUndOption controller) {
    var entscheidung = widget.entscheidung;
    setState(() {
      controllers.remove(controller);
      int index = datenbank.entscheidungen.indexOf(entscheidung);
      datenbank.entscheidungen[index].optionen.remove(controller.option);
      controller.controller.dispose();
    });
  }

  void plus() {
    var option = widget.entscheidung.add("");
    setState(() {
      ControllerUndOption CuO = ControllerUndOption();
      controllers.add(CuO);
      CuO.option = option;
      CuO.controller.text = option.text;
      CuO.controller.addListener(() {
        setState(() {
          option.text = CuO.controller.text;
        });
      });
    });
  }
}
