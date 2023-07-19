class InfoModel {
  String seed;

  InfoModel({
    required this.seed,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(seed: json["seed"] as String? ?? "");
  }
}
