import 'dart:convert';

import 'package:http/http.dart';
import 'package:practice/data/model/data_model.dart';

class ApiProvider {
  static Future<DataModel> getData({
    required int page,
    required int size,
  }) async {
    Response response = await get(Uri.parse(
        "https://api.instantwebtools.net/v1/passenger?page=$page&size=$size"));

    if (response.statusCode == 200) {
      print(response.body);
      return DataModel.fromJson(jsonDecode(response.body));
    }
    return DataModel(data: [], totalPages: 0, totalPassengers: 0);
  }
}