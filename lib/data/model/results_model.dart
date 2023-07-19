class ResultsModel {
  String gender;

  ResultsModel({
    required this.gender,
  });

  factory ResultsModel.fromJson(Map<String, dynamic> json) {
    return ResultsModel(gender: json["gender"] as String? ?? "");
  }
}
