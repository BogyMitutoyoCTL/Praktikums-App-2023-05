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
    for (int i = 0; i < 10; i++) {
      _text.add("Lorem ipsum 2");

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
        ],
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Edit Optionen"),
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
}
