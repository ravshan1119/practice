import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:practice/data/model/data_model.dart';
import 'package:practice/data/model/universal_data.dart';
import 'package:practice/data/network/network_utils.dart';
import 'package:practice/utils/constants.dart';

class ApiProvider {
  static Future<UniversalData> getData({
    required int page,
    required int count,
  }) async {
    // https://api.instantwebtools.net/v1/passenger?page=3&size=10
    Uri uri = Uri.https(
      baseUrl,
      "/v1/passenger",
      {
        "page": page.toString(),
        "size": count.toString(),
      },
    );

    try {
      http.Response response = await http.get(uri);
      print(response.body);

      if (response.statusCode == HttpStatus.ok) {
        return UniversalData(
            data: DataModel.fromJson(jsonDecode(response.body)));
      }
      return handleHttpErrors(response);
    } on SocketException {
      return UniversalData(error: "Internet Error!");
    } on FormatException {
      return UniversalData(error: "Format Error!");
    } catch (err) {
      debugPrint("ERROR:$err. ERROR TYPE: ${err.runtimeType}");
      return UniversalData(error: err.toString());
    }
  }
}