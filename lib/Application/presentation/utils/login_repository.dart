import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../Domain/Models/authentication/login_model.dart';

class LoginRepository {
  static Future<String> login(
      {required LoginModel loginModel,
      //   required String email,
      // required String password,
      required BuildContext context}) async {
    print("1");
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: loginModel.email, password: loginModel.password);
      print("2");

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('You are Logged in')));
      return 'You are Logged in';
    } on FirebaseAuthException catch (e) {
      print("4");
      print(e.code);
      //  if (e.code == 'user-not-found') {
      print("5");
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No user Found with this Email')));
      // } else if (e.code == 'wrong-password') {
      //   print("6");
      //   ScaffoldMessenger.of(context)
      //       .showSnackBar(const SnackBar(content: Text('Password did not match')));
      // }
      return "Error found";
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      return e.toString();
    }
  }
}
