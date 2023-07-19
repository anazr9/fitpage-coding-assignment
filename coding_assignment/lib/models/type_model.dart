class VarType {
  final String? type;
  final List<dynamic>? values;
  final String? studyType;
  final String? parameterName;
  final int? minValue;
  final int? maxValue;
  final int? defaultValue;

  const VarType({
    this.type,
    this.values,
    this.studyType,
    this.parameterName,
    this.minValue,
    this.maxValue,
    this.defaultValue,
  });

  factory VarType.fromJson(Map<String, dynamic> json) => VarType(
        type: json["type"],
        values: json["values"] == null
            ? []
            : List<dynamic>.from(json["values"]!.map((x) => x)),
        studyType: json["study_type"],
        parameterName: json["parameter_name"],
        minValue: json["min_value"],
        maxValue: json["max_value"],
        defaultValue: json["default_value"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "values":
            values == null ? [] : List<dynamic>.from(values!.map((x) => x)),
        "study_type": studyType,
        "parameter_name": parameterName,
        "min_value": minValue,
        "max_value": maxValue,
        "default_value": defaultValue,
      };
}
