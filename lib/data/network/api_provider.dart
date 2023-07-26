import 'dart:convert';

import 'package:http/http.dart';
import 'package:practice/data/model/user_model.dart';
import 'package:practice/data/network/universal_data.dart';

class ApiProvider {
  Future<UniversalData> getData() async {
    Response response =
        await get(Uri.parse("https://jsonplaceholder.typicode.com/albums"));

    try {
      if (response.statusCode == 200) {
        print(response.body);
        return UniversalData(
            data: (jsonDecode(response.body) as List?)
                ?.map((e) => UserModel.fromJson(e))
                .toList());
      }
      return UniversalData(error: "error");
    } catch (err) {
      return UniversalData(error: err.toString());
    }
  }
}
