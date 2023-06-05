import 'Entscheidung.dart';

class Datenbank {
  List<Entscheidung> entscheidungen = [];

  Datenbank(){}

  Datenbank.fromJson(Map<String, dynamic> json)
      : entscheidungen = []{
    entscheidungen = List<Entscheidung>.from(json['entscheidungen'].map((e) => Entscheidung.fromJson(e)).toList());
  }

  Map<String, dynamic> toJson() => {
    "entscheidungen" : entscheidungen
  };

  Entscheidung add(String fragestellung) {
    var neueEntscheidung = Entscheidung(fragestellung);
    entscheidungen.add(neueEntscheidung);
    return neueEntscheidung;
  }
}
