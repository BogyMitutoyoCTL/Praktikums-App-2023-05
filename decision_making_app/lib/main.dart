import 'dart:convert';

import 'package:decision_making_app/DecisionMakingApp.dart';
import 'package:flutter/material.dart';

import 'Datenbank.dart';

var datenbank = Datenbank();

void main() {
  var kochen = datenbank.add("Was kochen wir heute?");
  kochen.add("Nudeln");
  kochen.add("Spaghetti");
  kochen.add("Reis");
  var sport = datenbank.add("Wie halten wir uns heute fit?");
  sport.add("Fußball");
  sport.add("Schwimmen");

  runApp(const DecisionMakingApp());

}
