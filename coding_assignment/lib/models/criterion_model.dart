import 'package:coding_assignment/models/variable_model.dart';

class Criterion {
  final String? type;
  final String? text;
  final Variable? variable;

  const Criterion({
    this.type,
    this.text,
    this.variable,
  });

  factory Criterion.fromJson(Map<String, dynamic> json) => Criterion(
        type: json["type"],
        text: json["text"],
        variable: json["variable"] == null
            ? null
            : Variable.fromJson(json["variable"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "text": text,
        "variable": variable?.toJson(),
      };
}
