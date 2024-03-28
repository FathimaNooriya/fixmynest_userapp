import 'package:flutter/material.dart';
import '../../../core/padding.dart';
import '../common_widget/tittles.dart';

class UserOtpLoginScreen extends StatelessWidget {
  const UserOtpLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: Paddings.myPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Tittles(tittle: "Mobile OTP Login"),
            // TextFirmFieldWithTitle(
            //     textFeildTittle: "Enter the 10 digit mobile number",
            //     myController: ,
            //     validatorFunction: ,
            //     ),
            // Button1(buttonText: "Send OTP",
            // buttonPressed: ,
            // ),
            // TextWithLink(
            //     bottomText: "Sign in with Email?", linkText: "Sign in"),
          ],
        ),
      ),
    );
  }
}
