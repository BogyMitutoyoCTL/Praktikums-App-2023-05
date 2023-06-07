import 'package:decision_making_app/DecisionMakingApp.dart';
import 'package:decision_making_app/OnlineJsonToOwnFormat.dart';
import 'package:flutter/material.dart';

import 'Datenbank.dart';

var datenbank = Datenbank();

Future<void> main() async {
  runApp(const DecisionMakingApp());
}
