import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:practice/lib/data/models/universal_model.dart';

class ApiService{



  Future<UniversalResponse> getData() async {
    try {
      var response =
      await Dio().get('https://easyenglishuzb.free.mockoapp.net/countries');
      if (response.statusCode == 200) {
        if (response.data != null &&
            response.data['data'] != null &&
            response.data['data']['countries'] is List) {

            return UniversalResponse(data:
            (response.data['data']['countries']) as List?

            );

        } else {
          debugPrint("Data format is not as expected");
          return UniversalResponse(error: "error");
        }
      } else {
        debugPrint("Request failed with status: ${response.statusCode}");
        return UniversalResponse(error: "error");

      }
    } catch (e) {
      debugPrint("An error occurred: $e");
      return UniversalResponse(error: e.toString());

    }
  }

}