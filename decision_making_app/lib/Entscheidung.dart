import 'package:decision_making_app/Option.dart';

class Entscheidung {
  String fragestellung;
  List<Option> optionen = [];

  Entscheidung(this.fragestellung);

  void add(String option) {
    optionen.add(Option(option));
  }
}
