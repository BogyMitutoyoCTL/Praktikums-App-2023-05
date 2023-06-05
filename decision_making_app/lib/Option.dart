import 'dart:convert';

class Option {
  String text = "";

  Option(this.text);

  @override
  String toString() {
    return text;
  }

  Map<String, dynamic> toJson() => {
        "option": text,
      };
}
