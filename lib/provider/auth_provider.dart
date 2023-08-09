import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice/ui/home_page.dart';

class AuthProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  _checkSignUpAuthState() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  Stream<User?> authStateChanges() => FirebaseAuth.instance.authStateChanges();

  Future<void> signUpUser(BuildContext context) async {
    String email = emailController.text;
    String password = passwordController.text;
    try {
      isLoading = true;
      notifyListeners();
      // final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      manageMessage(context, e.code);
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (error) {
      manageMessage(context, error.toString());
    }
  }

  manageMessage(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
    isLoading = false;
    notifyListeners();
  }
}
