// Import the test package and Counter class

import 'package:decision_making_app/Entscheidung.dart';
import 'package:decision_making_app/not_my_cloud.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('not_my_cloud_test', () {
    test('authentification', () async {
      final opt = NotMyCloud();
      var data = await opt.get_some_cloud_data();

      expect(opt.user_is_valid, true);
      expect(data.isNotEmpty, true);
    });

    test('convert data', () async {
      final opt = NotMyCloud();
      var data = await opt.get_some_cloud_data();

      for (var record in data) {
        print(record.data["fragestellung"]);
        for (var option in record.expand["optionen"]!) {
          print("   " + option.data["option"]);
        }
      }
    }, tags: 'database');

    test('create option', () async {
      final opt = NotMyCloud();
      var data = await opt.create_option("Wasser");
      print(data);
      expect(data.isNotEmpty, true);
    }, tags: 'database');

    test('create decision', () async {
      final opt = NotMyCloud();
      Entscheidung e = Entscheidung("Metalle");
      e.add("Gold");
      e.add("Silber");
      e.add("Bronze");

      List<String> optionIDs = [];
      for (var option in e.optionen) {
        var id = await opt.create_option(option.text);
        optionIDs.add(id);
      }
      String id = await opt.create_entscheidung(e.fragestellung, optionIDs);

      print(id);
      expect(id.isNotEmpty, true);
    }, tags: 'database');
  });
}
