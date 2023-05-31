class Entscheidung {
  String fragestellung;
  List<String> optionen = [];

  Entscheidung(String this.fragestellung) {}

  void add(String option) {
    optionen.add(option);
  }
}
