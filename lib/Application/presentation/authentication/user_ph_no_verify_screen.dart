import 'package:flutter/material.dart';
import '../../../core/padding.dart';
import '../common_widget/tittles.dart';
import 'Wigets/button1.dart';
import 'Wigets/text_with_link.dart';
import 'Wigets/textfield_and_tittle.dart';

class UserPhNoVerifyScreen extends StatelessWidget {
  const UserPhNoVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: Paddings.myPadding,
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Tittles(tittle: "Verify Phone Number"),
        //     TextFirmFieldWithTitle(
        //         textFeildTittle: "Enter the 10 digit mobile number"),
        //     Button1(buttonText: "Send OTP"),
        //     TextWithLink(
        //         bottomText: "Sign in with Email?", linkText: "Sign in"),
        //   ],
        // ),
      ),
    );
  }
}
