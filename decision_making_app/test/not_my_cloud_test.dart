// Import the test package and Counter class
import 'package:decision_making_app/not_my_cloud.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('not_my_cloud_test', () {
    test('authentification', () async {
      final opt = NotMyCloud();
      await opt.get_some_cloud_data();

      expect(opt.user_is_vaild, true);
      expect(opt.fetched_data.isNotEmpty, true);
    });
  });
}
