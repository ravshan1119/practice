import 'package:practice/data/model/person_model.dart';

class DataModel {
  int totalPassengers;
  int totalPages;
  List<PersonModel> data;

  DataModel({
    required this.data,
    required this.totalPages,
    required this.totalPassengers,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      data: json["data"],
      totalPages: json["totalPages"] as int? ?? 0,
      totalPassengers: json["totalPassengers"] as int? ?? 0,
    );
  }
}
