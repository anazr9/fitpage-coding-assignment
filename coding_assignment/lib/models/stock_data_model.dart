import 'package:coding_assignment/models/criterion_model.dart';
import 'package:flutter/material.dart';

class ScanData {
  final int? id;
  final String? name;
  final String? tag;
  final String? color;
  final List<Criterion>? criteria;

  const ScanData({
    this.id,
    this.name,
    this.tag,
    this.color,
    this.criteria,
  });

  factory ScanData.fromJson(Map<String, dynamic> json) => ScanData(
        id: json["id"],
        name: json["name"],
        tag: json["tag"],
        color: json["color"],
        criteria: json["criteria"] == null
            ? []
            : List<Criterion>.from(
                json["criteria"]!.map((x) => Criterion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tag": tag,
        "color": color,
        "criteria": criteria == null
            ? []
            : List<dynamic>.from(criteria!.map((x) => x.toJson())),
      };
  // The `subtitleColor` getter method returns a Color based on the value of the `color` variable.

  Color? get subtitleColor {
    if (color == "green") {
      return Colors.green;
    } else if (color == "red") {
      return Colors.red;
    }
    return Colors.black;
  }
}
