// Import the test package and Counter class
import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:decision_making_app/Datenbank.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Datenbank', ()
  {
    test('4 elements added...', () {
      final data = Datenbank();
      data.add("Wer macht heute den Abwasch?");
      data.add("Was ist Deine Lieblingsfarbe?");

      expect(data.entscheidungen.length, 2);
    });

    test('Encode json', () {
      final data = Datenbank();
      data.add("A");
      data.add("B");
      var json = jsonDecode(jsonEncode(data));
      print(json);

      var expected = jsonDecode(r'''{
"entscheidungen": [
  {
    "optionen": [],
    "fragestellung": "B"
  },
  {
    "fragestellung": "A",
    "optionen": []
  }
]}''');
      expect(DeepCollectionEquality.unordered().equals(json, expected), true);
    });
  });
}