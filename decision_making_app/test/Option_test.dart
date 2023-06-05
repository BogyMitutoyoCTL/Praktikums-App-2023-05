// Import the test package and Counter class
import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:decision_making_app/Option.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Option', () {
    test('Konstruktor mit Wert...', () {
      final opt = Option("Kaffee");

      expect(opt.text, "Kaffee");
    });

    test('Konstruktor ohne Wert...', () {
      final opt = Option("");

      expect(opt.text, "");
    });

    test('Encode json...', () {
      final data = Option("testA");
      var json = jsonDecode(jsonEncode(data));
      print(json);

      var expected = jsonDecode('{"option": "testA"}');
      expect(DeepCollectionEquality.unordered().equals(json, expected), true);
    });
  });
}
