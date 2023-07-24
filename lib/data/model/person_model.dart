// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

import 'dart:convert';

PersonModel temperaturesFromJson(String str) => PersonModel.fromJson(json.decode(str));

String temperaturesToJson(PersonModel data) => json.encode(data.toJson());

class PersonModel {
  String id;
  String name;
  int trips;
  List<Airline> airline;
  int v;

  PersonModel({
    required this.id,
    required this.name,
    required this.trips,
    required this.airline,
    required this.v,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
    id: json["_id"],
    name: json["name"],
    trips: json["trips"],
    airline: List<Airline>.from(json["airline"].map((x) => Airline.fromJson(x))),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "trips": trips,
    "airline": List<dynamic>.from(airline.map((x) => x.toJson())),
    "__v": v,
  };
}

class Airline {
  String id;
  int airlineId;
  String name;
  String country;
  String logo;
  String slogan;
  String headQuaters;
  String website;
  String established;
  int v;

  Airline({
    required this.id,
    required this.airlineId,
    required this.name,
    required this.country,
    required this.logo,
    required this.slogan,
    required this.headQuaters,
    required this.website,
    required this.established,
    required this.v,
  });

  factory Airline.fromJson(Map<String, dynamic> json) => Airline(
    id: json["_id"],
    airlineId: json["id"],
    name: json["name"],
    country: json["country"],
    logo: json["logo"],
    slogan: json["slogan"],
    headQuaters: json["head_quaters"],
    website: json["website"],
    established: json["established"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "id": airlineId,
    "name": name,
    "country": country,
    "logo": logo,
    "slogan": slogan,
    "head_quaters": headQuaters,
    "website": website,
    "established": established,
    "__v": v,
  };
}
