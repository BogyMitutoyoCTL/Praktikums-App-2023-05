import 'Entscheidung.dart';

class Datenbank {
  List<Entscheidung> entscheidungen = [];

  Datenbank(){}

  Datenbank.fromJson(Map<String, dynamic> json)
      : entscheidungen = json['entscheidungen'];

  Map<String, dynamic> toJson() => {
    "entscheidungen" : entscheidungen
  };

  Entscheidung add(String fragestellung) {
    var neueEntscheidung = Entscheidung(fragestellung);
    entscheidungen.add(neueEntscheidung);
    return neueEntscheidung;
  }
}
