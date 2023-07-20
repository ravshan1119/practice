// {
// "_id": "6453beb43837279254e7cef1",
// "id": 5,
// "name": "Sri Lankan Airways 667",
// "country": "Sri Lanka",
// "logo": "https://upload.wikimedia.org/wikipedia/en/thumb/9/9b/Qatar_Airways_Logo.svg/sri_lanka.png",
// "slogan": "From Sri Lanka",
// "head_quaters": "Katunayake, Sri Lanka",
// "website": "www.srilankaairways.com",
// "established": "1990",
// "__v": 0
// }

class AirlineModel {
  String airline_id;
  int id;
  String name;
  String country;
  String logo;
  String slogan;
  String head_quaters;
  String website;
  String established;

  AirlineModel({
    required this.name,
    required this.id,
    required this.logo,
    required this.airline_id,
    required this.country,
    required this.established,
    required this.head_quaters,
    required this.slogan,
    required this.website,
  });

  factory AirlineModel.fromJson(Map<String, dynamic> json) {
    return AirlineModel(
      name: json["name"] as String? ?? "",
      id: json["id"] as int? ?? 0,
      logo: json["logo"] as String? ?? "",
      airline_id: json["airline_id"] as String? ?? "",
      country: json["country"] as String? ?? "",
      established: json["established"] as String? ?? "",
      head_quaters: json["head_quaters"] as String? ?? "",
      slogan: json["slogan"] as String? ?? "",
      website: json["website"] as String? ?? "",
    );
  }
}
