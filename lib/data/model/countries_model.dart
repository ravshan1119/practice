

class CountriesModel {
  String code;
  String name;
  String phone;
  Continent continent;
  String capital;
  String currency;
  String emoji;

  CountriesModel({
    required this.code,
    required this.name,
    required this.phone,
    required this.continent,
    required this.capital,
    required this.currency,
    required this.emoji,
  });

  factory CountriesModel.fromJson(Map<String, dynamic> json) => CountriesModel(
    code: json["code"]??'' ,
    name: json["name"]??'',
    phone: json["phone"]??'',
    continent: Continent.fromJson(json["continent"]),
    capital: json["capital"]??'',
    currency: json["currency"]??'',
    emoji: json["emoji"]??'',
  );


}

class Continent {
  String code;
  String name;

  Continent({
    required this.code,
    required this.name,
  });

  factory Continent.fromJson(Map<String, dynamic> json) => Continent(
    code: json["code"]??'',
    name: json["name"]??'',
  );


}
