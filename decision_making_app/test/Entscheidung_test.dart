// Import the test package and Counter class
import 'package:decision_making_app/Entscheidung.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Entscheidung', ()
  {
    test('4 elements added...', () {
      final entsch = Entscheidung("Was muss heute die Spülmaschine ausräumen?");
      entsch.add("Peter");
      entsch.add("Klaus");
      entsch.add("Miriam");
      entsch.add("Eva");

      expect(entsch.optionen.length, 4);
    });
  });
}