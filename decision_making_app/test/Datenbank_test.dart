// Import the test package and Counter class
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
  });
}