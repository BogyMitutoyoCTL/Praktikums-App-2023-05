class Option {
  String text = "";

  Option(this.text);

  Option.fromJson(Map<String, dynamic> json) : text = json["option"] {}

  @override
  String toString() {
    return text;
  }

  Map<String, dynamic> toJson() => {
        "option": text,
      };

  @override
  bool operator ==(Object other) {
    if (super == other) return true;
    if (other is! Option) return false;
    if (this.text == other.text) return true;
    return false;
  }
}
