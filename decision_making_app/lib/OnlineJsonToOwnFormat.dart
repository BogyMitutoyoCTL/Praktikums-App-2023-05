import 'package:decision_making_app/Entscheidung.dart';
import 'package:decision_making_app/main.dart';
import 'package:decision_making_app/not_my_cloud.dart';

class OnlineJsonToOwnFormat {
  Future<void> getData() async {
    final opt = NotMyCloud();
    var data = await opt.get_some_cloud_data();

    for (var record in data) {
      Entscheidung entscheidung = datenbank.add(record.data["fragestellung"]);
      for (var option in record.expand["optionen"]!) {
        entscheidung.add(option.data["option"]);
      }
    }
  }
}
