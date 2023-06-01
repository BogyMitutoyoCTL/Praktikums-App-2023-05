import 'package:decision_making_app/Option.dart';

class Entscheidung {
  String fragestellung;
  List<Option> optionen = [];

  Entscheidung(this.fragestellung);

  Option add(String option) {
    var erg = Option(option);
    optionen.add(erg);
    return erg;
  }
}
