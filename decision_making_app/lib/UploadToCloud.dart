import 'Entscheidung.dart';
import 'main.dart';
import 'not_my_cloud.dart';

class UploadToCloud {
  Future<void> uploadData() async {
    final opt = NotMyCloud();
    List<Entscheidung> entscheidungen = datenbank.entscheidungen;


    for (Entscheidung e in entscheidungen) {
      List<String> optionIDs = [];
      for (var option in e.optionen) {
        var id = await opt.create_option(option.text);
        optionIDs.add(id);
      }
      String id = await opt.create_entscheidung(e.fragestellung, optionIDs);
    }
  }
}
