import 'package:flutter/material.dart';
import 'package:practice/data/model/data_model.dart';
import 'package:practice/data/model/person_model.dart';
import 'package:practice/data/model/universal_data.dart';
import 'package:practice/data/network/api_provider.dart';

class PaginationDataScreen extends StatefulWidget {
  const PaginationDataScreen({Key? key}) : super(key: key);

  @override
  State<PaginationDataScreen> createState() => _PaginationDataScreenState();
}

class _PaginationDataScreenState extends State<PaginationDataScreen> {
  final ScrollController scrollController = ScrollController();

  int currentPage = 1;
  int countOfPage = 5;
  String queryText = "";
  bool isLoading = false;

  List<PersonModel> personModel = [];

  _fetchResult() async {
    setState(() {
      isLoading = true;
    });
    UniversalData universalData = await ApiProvider.getData(
      page: currentPage,
      count: countOfPage,
    );

    setState(() {
      isLoading = false;
    });

    if (universalData.error.isEmpty) {
      DataModel dataModel = universalData.data as DataModel;
      personModel.addAll(dataModel.data);
      setState(() {});
    }
    currentPage++;
  }

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _fetchResult();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            controller: scrollController,
            children: [
              ...List.generate(personModel.length, (index) {
                PersonModel persons = personModel[index];
                return Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16)),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(persons.name),
                      Text(persons.id.toString()),
                      Text(
                        persons.airline[index].website,
                        maxLines: 1,
                      ),
                      Text(persons.airline[index].country),
                    ],
                  ),
                );
              }),
              Visibility(
                visible: isLoading,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
