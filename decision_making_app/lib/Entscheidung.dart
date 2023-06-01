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

  @override
  String toString() {
    String liste = "";
    for (int i = 0; i < optionen.length; i++) {
      liste = liste + optionen[i].toString();
      liste = liste + "\n";
    }
    return liste;
  }
}
