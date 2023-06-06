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

    test('Datenbank_equality', () {
      final expected = Datenbank();
      expected.add("A");
      expected.add("B");

      final actual = Datenbank();
      actual.add("A");
      actual.add("B");

      expect(expected, actual);
    });

    test('Datenbank_equality_unordered', () {
      final expected = Datenbank();
      expected.add("A");
      expected.add("B");

      final actual = Datenbank();
      actual.add("B");
      actual.add("A");

      expect(expected == actual, false);
    });


    test('encode_json', () {
      final data = Datenbank();
      data.add("A");
      data.add("B");
      var json = jsonDecode(jsonEncode(data));

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


    test('decode_json', () {
      final expected = Datenbank();
      expected.add("A");
      expected.add("B");

      var input = r'''{
"entscheidungen": [
  {
    "optionen": [],
    "fragestellung": "A"
  },
  {
    "fragestellung": "B",
    "optionen": []
  }
]}''';

      Map<String, dynamic> json = jsonDecode(input);
      var actual = Datenbank.fromJson(json);

      expect(expected, actual);
    });

    test('decode_large_json', () {
      final expected = Datenbank();
      expected.add("A");
      expected.entscheidungen[0].add("C");
      expected.add("B");
      expected.entscheidungen[1].add("D");

      var input = r'''{
"entscheidungen": [
  {
    "optionen": [
      {"option": "C"}
    ],
    "fragestellung": "A"
  },
  {
    "optionen": [
      {"option": "D"}
    ],
    "fragestellung": "B"
  }
]}''';

      Map<String, dynamic> json = jsonDecode(input);
      var actual = Datenbank.fromJson(json);

      expect(expected, actual);
    });
  });
}