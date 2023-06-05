import 'dart:convert';

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
}
