// Import the test package and Counter class
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
    });
  });
}
