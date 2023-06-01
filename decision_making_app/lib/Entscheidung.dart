class Entscheidung {
  String fragestellung;
  List<String> optionen = [];

  Entscheidung(this.fragestellung);

  void add(String option) {
    optionen.add(option);
  }
}
