import 'Entscheidung.dart';
import 'package:collection/collection.dart';

class Datenbank {
  List<Entscheidung> entscheidungen = [];

  Datenbank() {}

  Datenbank.fromJson(Map<String, dynamic> json) : entscheidungen = [] {
    entscheidungen = List<Entscheidung>.from(
        json['entscheidungen'].map((e) => Entscheidung.fromJson(e)).toList());
  }

  Map<String, dynamic> toJson() => {"entscheidungen": entscheidungen};

  Entscheidung add(String fragestellung) {
    var neueEntscheidung = Entscheidung(fragestellung);
    entscheidungen.add(neueEntscheidung);
    return neueEntscheidung;
  }

  @override
  bool operator ==(Object other) {
    if (super == other) return true;
    if (other is! Datenbank) return false;
    if (DeepCollectionEquality()
        .equals(other.entscheidungen, this.entscheidungen)) return true;
    return false;
  }
}
