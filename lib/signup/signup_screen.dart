import 'package:flutter/material.dart';
import 'package:practice/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              TextField(
                controller: context.read<AuthProvider>().emailController,
              ),
              TextField(
                controller: context.read<AuthProvider>().passwordController,

              ),
              TextButton(
                  onPressed: () {
                    context.read<AuthProvider>().signUpUser(context);
                  },
                  child: Text("SignUp"))
            ],
          ),
        ],
      ),
    );
  }
}
