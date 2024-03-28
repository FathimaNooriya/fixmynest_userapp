import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneNumberRepository {
  String verificationId = " ";
  static Future<String> verifyPhoneNumber(
      {required int phoneNo, required BuildContext context}) async {
    print("............1111..........");
    String verificationId11 = " ";
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91 ${phoneNo}",
        
        // phoneNumber: '+91 9207 284 416',
        verificationCompleted: (PhoneAuthCredential credential) async {
          print("...........verfication..........");
          await FirebaseAuth.instance.signInWithCredential(credential);
          print("...........verfication compleate..........");
        },
        verificationFailed: (FirebaseAuthException e) {
          print("--------------------------------------------------");
          print(e.toString());
          print("...........Errrrror..........");
          if (e.code == "invalid-phone-number") {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Your phone Number is invailed')));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Something went wrong')));
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          print(verificationId);
          verificationId11 = verificationId;
          print("...........Code sent compleate..........");
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // verificationId = verificationId;
        },
      );
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Send OTP Succesfully")));
      return verificationId11;
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      return e.toString();
    }
  }

  static Future<bool> verifyOtp(
      {required String otp,
      required BuildContext context,
      required String verificationId}) async {
    print("...........OTP ..........");
    var credentials = await FirebaseAuth.instance.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: otp));
    print("...........otp compleate..........");
    return credentials.user != null ? true : false;

    //try {
    // FirebaseAuth auth = FirebaseAuth.instance;

    // await auth.verifyPhoneNumber(
    //   phoneNumber: '+44 7123 123 456',
    //   codeSent: (String verificationId, int? resendToken) async {
    //     // Update the UI - wait for the user to enter the SMS code
    //     String smsCode = 'xxxx';

    //     // Create a PhoneAuthCredential with the code
    //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //         verificationId: verificationId, smsCode: smsCode);

    //     // Sign the user in (or link) with the credential
    //     await auth.signInWithCredential(credential);
    //   },
    // );

    // FirebaseAuth auth = FirebaseAuth.instance;

    // await auth.verifyPhoneNumber(
    //   phoneNumber: "+91 ${phoneNo}",
    //   verificationFailed: (FirebaseAuthException e) {},
    //   codeSent: (String verificationId, int? resendToken) {},
    //   codeAutoRetrievalTimeout: (String verificationId) {},
    //   verificationCompleted: (PhoneAuthCredential credential) async {
    //     // ANDROID ONLY!

    //     // Sign the user in (or link) with the auto-generated credential
    //     await auth.signInWithCredential(credential);
    //   },
    // );
    // } catch (e) {}
  }
}
