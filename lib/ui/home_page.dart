import 'package:flutter/material.dart';
import 'package:practice/data/model/user_model.dart';
import 'package:practice/data/network/api_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = false;
  late UserModel userModel;

  _getMyData() async {
    setState(() {
      loading = true;
    });
    userModel = await ApiProvider.getData();

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    _getMyData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Center(child: Text(userModel!.results.first.name.title)),
                ],
              ));
  }
}

// FutureBuilder(
// future: apiProvider.getUserInfo(),
// builder:
// (BuildContext context, AsyncSnapshot<UniversalData> snapshot) {
// if (snapshot.connectionState == ConnectionState.waiting) {
// return const Center(
// child: CircularProgressIndicator(),
// );
// } else if (snapshot.hasData) {
// if (snapshot.data!.error.isEmpty) {
// UserModel userModel = snapshot.data!.data as UserModel;
// return Column(
// children: [
// Text(userModel.resultsModel.gender),
// ],
// );
// }
// }
// return Center(
// child: Center(child: Text(snapshot.data!.error)),
// );
// })
