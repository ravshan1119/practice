// {
// "_id": "6465fe89b149ab830d352d24",
// "name": "John Doe",
// "trips": 250,
// "airline": [
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
// ],
// "__v": 0
// }

import 'package:practice/data/model/airline_model.dart';

class PersonModel {
  String person_id;

  String name;
  num trips;
  AirlineModel airlineModel;

  PersonModel({
    required this.airlineModel,
    required this.person_id,
    required this.name,
    required this.trips,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      airlineModel: json["airlineModel"],
      person_id: json["person_id"] as String? ?? "",
      name: json["name"] as String? ?? "",
      trips: json["trips"] as num? ?? 0,
    );
  }
}
