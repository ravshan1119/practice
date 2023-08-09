import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice/provider/auth_provider.dart';
import 'package:practice/signup/signup_screen.dart';
import 'package:practice/ui/home_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => AuthProvider(),
        lazy: true,
      ),
    ],
    child: MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: SignUp(),
    );
  }
}
