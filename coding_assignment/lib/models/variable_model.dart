import 'package:coding_assignment/models/type_model.dart';

class Variable {
  final VarType? type1;
  final VarType? type2;
  final VarType? type3;
  final VarType? type4;

  const Variable({
    this.type1,
    this.type2,
    this.type3,
    this.type4,
  });

  factory Variable.fromJson(Map<String, dynamic> json) => Variable(
        type1:
            json["\u00241"] == null ? null : VarType.fromJson(json["\u00241"]),
        type2:
            json["\u00242"] == null ? null : VarType.fromJson(json["\u00242"]),
        type3:
            json["\u00243"] == null ? null : VarType.fromJson(json["\u00243"]),
        type4:
            json["\u00244"] == null ? null : VarType.fromJson(json["\u00244"]),
      );

  Map<String, dynamic> toJson() => {
        "\u00241": type1?.toJson(),
        "\u00242": type2?.toJson(),
        "\u00243": type3?.toJson(),
        "\u00244": type4?.toJson(),
      };
}
