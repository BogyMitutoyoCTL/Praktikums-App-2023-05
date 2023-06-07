import 'package:decision_making_app/Option.dart';

import 'Entscheidung.dart';
import 'package:collection/collection.dart';

class Datenbank {
  List<Entscheidung> entscheidungen = [];

  Datenbank();

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

  void deleteEmptyOptions() {
    for (int i = 0; i < entscheidungen.length; i++) {
      var entscheidung2 = entscheidungen[i];
      for (int j = 0; j < entscheidung2.optionen.length; j++) {
        if (entscheidung2.optionen[j].text == "") {
          var temp = entscheidung2.optionen[j];
          entscheidung2.optionen.remove(temp);
          j--;
        }
      }
    }
  }

  void addEmptyOptions(Entscheidung ausgewaehlteEntscheidung) {
    int anzahlLeereOptionen = 2;
    if (ausgewaehlteEntscheidung.optionen.length == 0) {
      for (int i = 0; i < anzahlLeereOptionen; i++) {
        ausgewaehlteEntscheidung.add("");
      }
    }
  }

  void deleteDuplicateOptions() {
    {
      for (int i = 0; i < entscheidungen.length; i++) {
        var entscheidung2 = entscheidungen[i];
        for (int basis = 0;
            basis < entscheidung2.optionen.length - 1;
            basis++) {
          for (int vgl = basis + 1;
              vgl < entscheidung2.optionen.length;
              vgl++) {
            if (entscheidung2.optionen[basis].toString() ==
                entscheidung2.optionen[vgl].toString()) {
              var temp = entscheidung2.optionen[vgl];
              entscheidung2.optionen.remove(temp);
              vgl--;
            }
          }
        }
      }
    }
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
