// Import the test package and Counter class
import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:decision_making_app/Entscheidung.dart';
import 'package:decision_making_app/Option.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Entscheidung', () {
    test('4 elements added...', () {
      final entsch = Entscheidung("Was muss heute die Spülmaschine ausräumen?");
      entsch.add("Peter");
      entsch.add("Klaus");
      entsch.add("Miriam");
      entsch.add("Eva");

      expect(entsch.optionen.length, 4);
    });
    test('Encode json Entscheidung', () {
      final data = Entscheidung("Was essen wir heute?");
      data.optionen.add(Option("Nudeln"));
      data.optionen.add(Option("Fisch"));
      var json = jsonDecode(jsonEncode(data));
      print(json);
      var expected = jsonDecode(r'''{
      "optionen": [{"option": "Nudeln"},{"option": "Fisch"}],
      "fragestellung": "Was essen wir heute?"
      }''');
      expect(DeepCollectionEquality.unordered().equals(json, expected), true);
    });
    test('Decode json Entscheidung', () {
      final expected = Entscheidung("Was essen wir heute?");
      expected.optionen.add(Option("Nudeln"));
      expected.optionen.add(Option("Fisch"));

      var input = r'''{
      "optionen": [{"option": "Nudeln"},{"option": "Fisch"}],
      "fragestellung": "Was essen wir heute?"
      }''';

      Map<String, dynamic> json = jsonDecode(input);
      var actual = Entscheidung.fromJson(json);

      expect(actual, expected);
    });
    test("entscheidungen vergleichen", () {
      var a = Entscheidung("Wie halten wir uns heute fit?");
      var b = Entscheidung("Wie halten wir uns heute fit?");
      a.optionen.add(Option("Nudeln"));
      b.optionen.add(Option("Nudeln"));
      print(a.fragestellung);
      print(b.fragestellung);
      expect(a, b);
    });
  });
}
