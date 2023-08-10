import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../second_api_screen.dart';

class SecondApi extends StatefulWidget {
  const SecondApi({Key? key}) : super(key: key);

  @override
  State<SecondApi> createState() => _SecondApiState();
}

class _SecondApiState extends State<SecondApi> {
  List<dynamic>? jsonList;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      var response =
          await Dio().get('https://easyenglishuzb.free.mockoapp.net/companies');
      if (response.statusCode == 200) {
        if (response.data != null &&
            response.data['data'] != null &&
            response.data['data'] is List) {
          setState(() {
            jsonList = response.data['data'] as List;
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
        title: Text('Second  Api'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          var car = jsonList?[index];

          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarDetailScreen(car: car),
                  ),
                );
              },
              title: Text(car?['car_model'] ?? "No name"),
              leading: CachedNetworkImage(
                imageUrl: car?['logo'] ?? "",
                width: 60,
                height: 60,
                placeholder: (context, url) => CupertinoActivityIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          );
        },
        itemCount: jsonList?.length ?? 0,
      ),
    );
  }
}
