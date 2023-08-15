
class CompaniesModel {
  int id;
  String carModel;
  int averagePrice;
  String logo;
  int establishedYear;

  CompaniesModel({
    required this.id,
    required this.carModel,
    required this.averagePrice,
    required this.logo,
    required this.establishedYear,
  });

  factory CompaniesModel.fromJson(Map<String, dynamic> json) => CompaniesModel(
    id: json["id"] as int? ?? 0,
    carModel: json["car_model"] as String? ?? "",
    averagePrice: json["average_price"] as int? ?? 0,
    logo: json["logo"] as String? ?? "",
    establishedYear: json["established_year"] as int? ?? 0,
  );

}