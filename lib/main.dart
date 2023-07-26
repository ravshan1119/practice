import 'package:flutter/material.dart';
import 'package:practice/data/network/api_provider.dart';
import 'package:practice/providers/user_provider.dart';
import 'package:practice/ui/get_data_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(apiProvider: ApiProvider()),
          lazy: true,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetDataScreen(),
    );
  }
}
