import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'Datenbank.dart';

class StoreFiles {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print(path);
    return File('$path/DecisionMakingApp.json');
  }

  Future<File> writeData(Datenbank data) async {
    final file = await _localFile;
    var string = jsonEncode(data.toJson());
    return file.writeAsString(string);
  }

  Future<Datenbank> readData() async {
    try {
      final file = await _localFile;

      final contents = await file.readAsString();
      Datenbank saved = Datenbank.fromJson(jsonDecode(contents));
      return saved;
    } catch (e) {
      return Datenbank();
    }
  }
}
