import 'package:flutter/material.dart';
import 'package:practice/data/model/data_model.dart';
import 'package:practice/data/model/person_model.dart';
import 'package:practice/data/network/api_provider.dart';

class PaginationDataScreen extends StatefulWidget {
  const PaginationDataScreen({Key? key}) : super(key: key);

  @override
  State<PaginationDataScreen> createState() => _PaginationDataScreenState();
}

class _PaginationDataScreenState extends State<PaginationDataScreen> {

  int currentPage = 1;
  int countOfPage = 5;
  bool isLoading = false;

  List<PersonModel> personModel = [];
  DataModel? dataModel;

  _fetchResult() async {
    setState(() {
      isLoading = true;
    });
    dataModel = await ApiProvider.getData(
      page: currentPage,
      size: countOfPage,
    );

    setState(() {
      isLoading = false;
    });

    if (dataModel!.data.isNotEmpty) {
      PersonModel newPersons = personModel as PersonModel;

      setState(() {});
    }
    currentPage++;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
      ...List.generate(personModel.length, (index) {
        return Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(16)),
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 50,
                width: 100,
                child:
                    Image.network(personModel[index].airlineModel.logo),
              ),
              Text(personModel[index].name),
              Text(personModel[index].person_id),
              Text(
                personModel[index].trips.toString(),
                maxLines: 1,
              ),
              Text(personModel[index].airlineModel.website),
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
      ),
    );
  }
}
