import 'package:flutter/material.dart';

class EditOptionen extends StatefulWidget {
  const EditOptionen({Key? key}) : super(key: key);

  @override
  State<EditOptionen> createState() => _EditOptionenState();
}

class _EditOptionenState extends State<EditOptionen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Edit Optionen"),
        ),
      ),
    );
  }
}
