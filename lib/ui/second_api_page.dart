import 'package:flutter/material.dart';
import 'package:practice/data/model/countries_model.dart';
import 'package:practice/data/model/universal_data.dart';
import 'package:practice/data/network/api_service.dart';

class SecondApiPage extends StatefulWidget {
  const SecondApiPage({super.key});

  @override
  State<SecondApiPage> createState() => _SecondApiPageState();
}

class _SecondApiPageState extends State<SecondApiPage> {
  ApiService apiService = ApiService();
  UniversalData? universalData;
  var list = [];
  bool isLoading = false;

  fetchData() async {
    setState(() {
      isLoading = true;
    });
    universalData = await apiService.getCountriesData();
    list = universalData!.data;

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
            child: Column(
                children: [
                  ...List.generate(
                    list.length,
                    (index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(list[index].name),
                            subtitle: Text(
                              list[index].phone,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                          ),
                          const Divider(color: Colors.black,)
                        ],
                      );
                    }
                  ),
                ],
              ),
          ),
    );
  }
}
