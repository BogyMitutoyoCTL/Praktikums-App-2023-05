import 'package:decision_making_app/Option.dart';
import 'package:collection/collection.dart';

class Entscheidung {
  String fragestellung;
  List<Option> optionen = [];

  Entscheidung(this.fragestellung);

  Option add(String option) {
    var erg = Option(option);
    optionen.add(erg);
    return erg;
  }

  Entscheidung.fromJson(Map<String, dynamic> json)
      : fragestellung = json["fragestellung"],
        optionen = []{
    optionen = List<Option>.from(json['optionen'].map((e) => Option.fromJson(e)).toList());
  }

  Map<String, dynamic> toJson() => {
        "optionen": optionen,
        "fragestellung": fragestellung,
      };

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    if (super == other) return true;
    if (other is! Entscheidung) return false;
    if (other.optionen.equals(this.optionen) &&
        other.fragestellung == this.fragestellung) return true;
    return false;
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
