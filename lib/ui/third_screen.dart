import 'package:flutter/material.dart';
import 'package:practice/data/model/companies_model.dart';
import 'package:practice/data/model/countries_model.dart';
import 'package:practice/data/model/universal_data.dart';
import 'package:practice/data/network/api_service.dart';

class ThirdApiPage extends StatefulWidget {
  const ThirdApiPage({super.key});

  @override
  State<ThirdApiPage> createState() => _ThirdApiPageState();
}

class _ThirdApiPageState extends State<ThirdApiPage> {
  ApiService apiService = ApiService();
  UniversalData? universalData;
  List<CompaniesModel> list = [];
  bool isLoading = false;

  fetchData() async {
    setState(() {
      isLoading = true;
    });
    universalData = await apiService.getCars();
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
                  ...List.generate(list.length, (index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(list[index].carModel),
                          subtitle: Text(
                            list[index].averagePrice.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                            ),
                          ),
                          leading: SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.network(list[index].logo),
                          ),
                        ),
                        const Divider(
                          color: Colors.black,
                        )
                      ],
                    );
                  }),
                ],
              ),
            ),
    );
  }
}
