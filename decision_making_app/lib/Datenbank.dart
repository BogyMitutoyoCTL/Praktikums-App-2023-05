import 'Entscheidung.dart';

class Datenbank {
  List<Entscheidung> entscheidungen = [];

  Entscheidung add(String fragestellung) {
    var neueEntscheidung = Entscheidung(fragestellung);
    entscheidungen.add(neueEntscheidung);
    return neueEntscheidung;
  }
}
