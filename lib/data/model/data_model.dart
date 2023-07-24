// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

import 'dart:convert';

import 'package:practice/data/model/person_model.dart';

DataModel temperaturesFromJson(String str) => DataModel.fromJson(json.decode(str));

String temperaturesToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  int totalPassengers;
  int totalPages;
  List<PersonModel> data;

  DataModel({
    required this.totalPassengers,
    required this.totalPages,
    required this.data,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    totalPassengers: json["totalPassengers"],
    totalPages: json["totalPages"],
    data: List<PersonModel>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "totalPassengers": totalPassengers,
    "totalPages": totalPages,
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}
