import 'package:decision_making_app/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:decision_making_app/Entscheidung.dart';
import 'package:decision_making_app/Option.dart';
import 'package:flutter/material.dart';
import 'package:decision_making_app/ControllerUndOption.dart';

class EditOptionen extends StatefulWidget {
  final Entscheidung bearbeiteteEntscheidung;

  const EditOptionen(this.bearbeiteteEntscheidung, {Key? key})
      : super(key: key);

  @override
  State<EditOptionen> createState() => _EditOptionenState();
}

class _EditOptionenState extends State<EditOptionen> {
  final List<ControllerUndOption> controllersMitOption = [];

  @override
  void initState() {
    super.initState();
    for (Option option in widget.bearbeiteteEntscheidung.optionen) {
      ControllerUndOption controllerMitOption = ControllerUndOption();
      controllersMitOption.add(controllerMitOption);
      controllerMitOption.option = option;
      controllerMitOption.controller.text = option.text;
      controllerMitOption.controller.addListener(() {
        setState(() {
          option.text = controllerMitOption.controller.text;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> textfelder = [];
    for (ControllerUndOption controllerMitOption in controllersMitOption) {
      textfelder.add(Row(
        children: [
          Expanded(
            child: TextField(
              controller: controllerMitOption.controller,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          IconButton(
              onPressed: () {
                onDelete(controllerMitOption);
              },
              icon: Icon(Icons.delete))
        ],
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(AppLocalizations.of(context)!.options),
              ),
            ),
            IconButton(onPressed: home, icon: Icon(Icons.home)),
          ],
        ),
      ),
      body: Center(
          child: Padding(
              padding: EdgeInsets.all(15),
              child: Scrollbar(
                thumbVisibility: true,
                child: ListView(
                  children: textfelder,
                ),
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: plus,
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }

  void onDelete(ControllerUndOption controllerUndOption) {
    print("ondelete erreicht");
    var entscheidung = widget.bearbeiteteEntscheidung;
    setState(() {
      entscheidung.optionen.remove(controllerUndOption.option);

      controllersMitOption.remove(controllerUndOption);
      controllerUndOption.controller.dispose();
    });
  }

  void plus() {
    var option = widget.bearbeiteteEntscheidung.add("");
    setState(() {
      ControllerUndOption controlUndOption = ControllerUndOption();
      controllersMitOption.add(controlUndOption);
      controlUndOption.option = option;
      controlUndOption.controller.text = option.text;
      controlUndOption.controller.addListener(() {
        setState(() {
          option.text = controlUndOption.controller.text;
        });
      });
    });
  }

  void home() {
    datenbank.deleteEmptyOptions();
    datenbank.deleteDuplicateOptions();
    Navigator.pushNamedAndRemoveUntil(context, '/start', (route) => false);
  }
}
