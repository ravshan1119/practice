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
   UserModel? userModel;

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
                  Center(child: Text(userModel?.results[0].email??'')),
                ],
              ));
  }
}