import 'package:flutter/material.dart';

import '../../../core/color_and_font/color_and_font.dart';
import '../../../core/padding.dart';
import '../common_widget/tittles.dart';
import 'Wigets/button1.dart';
import 'Wigets/textfield_and_tittle.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Paddings.myPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Tittles(tittle: "Change Password"),
            Padding(
              padding: Paddings.myPadding,
              child: Text(
                "Enter the 6 digit one time password, which is send to your registered mobile number",
                style: ColorAndFont.Normal_TEXT,
              ),
            ),
            const TextFormFieldWithhSufixButton(),
            // const TextFirmFieldWithTitle(
            //     textFeildTittle: "Enter the new password"),
            // const TextFirmFieldWithTitle(
            //     textFeildTittle: "Re-enter the new password"),
         //   const Button1(buttonText: "Submit"),
          ],
        ),
      ),
    );
  }
}

class TextFormFieldWithhSufixButton extends StatelessWidget {
  const TextFormFieldWithhSufixButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.myPadding,
      child: SizedBox(
        height: 65,
        child: TextFormField(
          decoration: InputDecoration(
            suffix: TextButton(
              child: const Text("Verify OTP"),
              onPressed: () {},
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
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
  // Padding(
            //   padding: Paddings.myPadding,
            //   child: Container(
            //     height: 65,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       border: Border.all(color: ColorAndFont.GREEN, width: 2),
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         SizedBox(
            //             width: MediaQuery.of(context).size.width * .5,
            //             child: TextFormField(
            //               decoration: InputDecoration(
            //                   border: UnderlineInputBorder(
            //                       borderSide: BorderSide.none)),
            //             )),
            //         FittedBox(
            //           fit: BoxFit.cover,
            //           child: ElevatedButton(
            //             style: ElevatedButton.styleFrom(
            //               backgroundColor: ColorAndFont.GREEN,
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(10),
            //               ),
            //             ),
            //             onPressed: () {},
            //             child: Text(
            //               "Verify OTP",
            //               style: ColorAndFont.BUTTON_TEXT,
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),