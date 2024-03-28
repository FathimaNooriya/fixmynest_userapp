import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../Domain/Models/authentication/registration_model.dart';

class RegistrationRepo {
  static Future<String> registration(
      // {required String email,
      // required String password,
      // required String name,
      // required String phoneNo,
      // required BuildContext context}
      {required RegistrationModel registration,
      required BuildContext context}) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: registration.userEmail,
        password: registration.userPassword,
      );
      await FirebaseAuth.instance.currentUser!
          .updateDisplayName(registration.userName);
      await FirebaseAuth.instance.currentUser!
          .updateEmail(registration.userEmail);
      final result = await FirestoreServices.saveUser(
          registration.userName,
          registration.userEmail,
          userCredential.user!.uid,
          registration.userPhoneNumber);
      ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('Registration Successful')));
      print(result);
      print('..........................');
      return 'Registration Successful';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password Provided is too weak')));
        return 'Password Provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email Provided already Exists')));
        return 'Email Provided already Exists';
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      return e.toString();
    }
    return "Something went wrong";
  }
}

class FirestoreServices {
  static saveUser(String name, String email, String uid, int phoneNo) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({'email': email, 'name': name, 'phone No': phoneNo, });
  }

  // or
  addUser(
      {required String name,
      required String email,
      required String uid,
      required int phoneNo}) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("Profile")
        .add({'email': email, 'name': name, 'phone No': phoneNo});
  }
  // or
  // .add(model.toMap())
}
