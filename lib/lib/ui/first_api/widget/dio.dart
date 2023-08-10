import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:practice/lib/data/models/universal_model.dart';
import 'package:practice/lib/data/network/providers/api_provider.dart';

import '../first_api_screen.dart';

class FirstApi extends StatefulWidget {
  const FirstApi({Key? key}) : super(key: key);

  @override
  State<FirstApi> createState() => _FirstApiState();
}

class _FirstApiState extends State<FirstApi> {
  List<dynamic>? jsonList;

  @override
  void initState() {
    super.initState();
    getData();
  }

  ApiService apiService = ApiService();
  UniversalResponse? universalResponse;


  fetchData()async{

    universalResponse = await apiService.getData();


  }

  void getData() async {
    try {
      var response =
      await Dio().get('https://easyenglishuzb.free.mockoapp.net/countries');
      if (response.statusCode == 200) {
        if (response.data != null &&
            response.data['data'] != null &&
            response.data['data']['countries'] is List) {
          setState(() {
            jsonList = response.data['data']['countries'] as List;
          });
        } else {
          debugPrint("Data format is not as expected");
        }
      } else {
        debugPrint("Request failed with status: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("An error occurred: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text('First  Api'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          var country = jsonList?[index];

          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CountryDetailScreen(countryData: country),
                  ),
                );
              },
              title: Text(country?['name'] ?? "No name"),
              leading: Text(country?['emoji'] ?? ""),
            ),
          );
        },
        itemCount: jsonList?.length ?? 0,
      ),
    );
  }
}
