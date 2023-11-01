import 'package:flutter/material.dart';
import '../../../core/color_and_font/color_and_font.dart';
import '../../../core/padding.dart';
import '../common_widget/tittles.dart';
import 'Wigets/button1.dart';

class UserVerifyPhNoScreen extends StatelessWidget {
  const UserVerifyPhNoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Paddings.myPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Tittles(tittle: "Verify OTP"),
            Text(
              "Enter the 6 digit one time password, which is send to your registered mobile number",
              style: ColorAndFont.Normal_TEXT,
            ),
            const Row(
              children: [
                OtpTextfield(),
                OtpTextfield(),
                OtpTextfield(),
                OtpTextfield(),
                OtpTextfield(),
                OtpTextfield(),
              ],
            ),
          //  const Button1(buttonText: "Verify OTP"),
          ],
        ),
      ),
    );
  }
}

class OtpTextfield extends StatelessWidget {
  const OtpTextfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: SizedBox(
        height: 60,
        width: 45,
        child: TextFormField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                width: 2,
                color: ColorAndFont.GREEN,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
