class UserModel {
  int userId;
  int id;
  String title;

  UserModel({required this.id, required this.title, required this.userId});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] as int? ?? 0,
      title: json["title"] as String? ?? "",
      userId: json["userId"] as int? ?? 0,
    );
  }
}
