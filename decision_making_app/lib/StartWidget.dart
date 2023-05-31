import 'package:flutter/material.dart';

class StartWidget extends StatefulWidget {
  const StartWidget({Key? key}) : super(key: key);

  @override
  State<StartWidget> createState() => _StartWidgetState();
}

class _StartWidgetState extends State<StartWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Entscheidungshilfe", style: TextStyle(fontSize: 25),),
        ),
      ),
      body: MaterialButton(onPressed: zufall),

    );
  }

  zufall()
  {


  }
}
