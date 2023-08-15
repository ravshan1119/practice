import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:practice/data/model/companies_model.dart';
import 'package:practice/data/model/company_model.dart';
import 'package:practice/data/model/countries_model.dart';
import 'package:practice/data/model/universal_data.dart';

class ApiService {
  Dio dio = Dio();

  Future<CompanyModel> getData() async {
    Response response =
        await dio.get("https://easyenglishuzb.free.mockoapp.net/companies/5");
    return CompanyModel.fromJson(response.data);

    // try {
    //   if (response.statusCode == 200) {
    //     print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa");
    //     return UniversalData(
    //       data: CompanyModel.fromJson(
    //         (jsonDecode(response.data.toString())),
    //       ),
    //     );
    //   }
    //   print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa");
    //
    //   return UniversalData(error: "error");
    // } catch (e) {
    //   return UniversalData(error: e.toString());
    // }
  }

  Future<UniversalData> getCountriesData() async {
    Response response =
        await dio.get("https://easyenglishuzb.free.mockoapp.net/countries");

    try {
      if (response.statusCode == 200) {

        return UniversalData(
            data: (response.data["data"]["countries"] as List?)
                ?.map((e) => CountriesModel.fromJson(e)).toList() ?? []);
      }
      return UniversalData(error: "error");
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }


  Future<UniversalData> getCars() async {
    Response response =
    await dio.get("https://easyenglishuzb.free.mockoapp.net/companies");

    try {
      if (response.statusCode == 200) {

        return UniversalData(
            data: (response.data["data"] as List?)
                ?.map((e) => CompaniesModel.fromJson(e)).toList() ?? []);
      }
      return UniversalData(error: "error");
    } catch (e) {
      return UniversalData(error: e.toString());
    }
  }
}
