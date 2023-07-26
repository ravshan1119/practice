import 'package:flutter/material.dart';
import 'package:practice/data/model/from_status.dart';
import 'package:practice/providers/user_provider.dart';
import 'package:provider/provider.dart';

class GetDataScreen extends StatelessWidget {
  const GetDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    userProvider.getDataInfo();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Data"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<UserProvider>(
              builder: (context, weatherProvider, child) {
                switch (weatherProvider.status) {
                  case FormStatus.pure:
                    return const Text("Hali data yuq , bo'shs holat");
                  case FormStatus.success:
                    return Center(
                        child: Column(
                      children: [
                        ...List.generate(
                            userProvider.userModel!.length,
                            (index) => ListTile(
                                  title: Text(
                                      userProvider.userModel![index].title),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(userProvider.userModel![index].userId
                                          .toString()),
                                      Text(userProvider.userModel![index].id
                                          .toString()),
                                    ],
                                  ),
                                  leading: const Icon(Icons.person),
                                ))
                      ],
                    ));
                  case FormStatus.failure:
                    return Center(child: Text(weatherProvider.errorText));
                  case FormStatus.loading:
                    return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
