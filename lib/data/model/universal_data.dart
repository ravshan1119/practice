import 'package:practice/data/model/countries_model.dart';

class UniversalData {
  String error;
  dynamic data = [
    CountriesModel(
      code: 'code',
      name: 'name',
      phone: 'phone',
      continent: Continent(code: '', name: 'name'),
      capital: 'capital',
      currency: 'currency',
      emoji: 'emoji',
    )
  ];

  UniversalData({this.data, this.error = ""});
}
