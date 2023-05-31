import 'package:flutter/material.dart';

class StartWidget extends StatefulWidget {
  const StartWidget({Key? key}) : super(key: key);

  @override
  State<StartWidget> createState() => _StartWidgetState();
}

class _StartWidgetState extends State<StartWidget> {
  @override
  Widget build(BuildContext context) {
    List<Widget> buttons=[];
    for(int i=0; i<7; i++)
      {
        buttons.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(child: MaterialButton(onPressed: zufall,
          child: Text("Inhalt"), textColor: Colors.black,
          ),
            color: Colors.white,),

        ),);
      }
    //TODO Inhalte in Buttons
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.black12,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("Entscheidungshilfe", style: TextStyle(fontSize: 25, color: Colors.white),),
          ),
        ),
      ),
      body:
          Center(
            child: Scrollbar(
              thumbVisibility: true,
              child: ListView(
                children: buttons,


              ),
            ),
          ),

      //backgroundColor: Colors.black26,

    );
  }



  zufall()
  {


  }
}
