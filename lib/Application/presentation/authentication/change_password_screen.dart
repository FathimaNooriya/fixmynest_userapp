import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/color_and_font/color_and_font.dart';
import '../../../core/padding.dart';
import '../../Business_logic/authentication/bloc/auth_bloc.dart';
import '../common_widget/tittles.dart';
import 'Wigets/button1.dart';
import 'user_login_screen.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: context.read<AuthBloc>().resetPasswordKey,
        child: Padding(
          padding: Paddings.myPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Tittles(tittle: "Change Password"),
              Padding(
                padding: Paddings.myPadding,
                child: Text(
                  "Enter your registered Email Id",
                  //   "Enter the 6 digit one time password, which is send to your registered mobile number",
                  style: ColorAndFont.Normal_TEXT,
                ),
              ),
              const TextFormFieldWithhSufixButton(),
              // TextFirmFieldWithTitle(
              //     textFeildTittle: "Enter the new password",
              //     myController: context.read<AuthBloc>().passwordController,
              //     validatorFunction: () {
              //       String password =
              //           context.read<AuthBloc>().passwordController.text;
              //       if (password == "" || password.length < 6) {
              //         return "Enter a valid password";
              //       }
              //       return null;
              //     }),
              // TextFirmFieldWithTitle(
              //   textFeildTittle: "Re-enter the new password",
              //   myController:
              //       context.read<AuthBloc>().reenterPasswordController,
              //   validatorFunction: () {
              //     String password =
              //         context.read<AuthBloc>().passwordController.text.trim();
              //     String newPpassword = context
              //         .read<AuthBloc>()
              //         .reenterPasswordController
              //         .text
              //         .trim();
              //     if (password != newPpassword) {
              //       return "Password does not match";
              //     }
              //     return null;
              //   },
              // ),
              BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
                if (state is VerifySuccess) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserLoginScreen()));
                }
              }, builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Button1(
                    buttonText: "Submit",
                    buttonPressed: () {
                      final bool val = context
                          .read<AuthBloc>()
                          .resetPasswordKey
                          .currentState!
                          .validate();
                      if (val) {
                        context.read<AuthBloc>().add(ResetPasswordEvent(
                            email: context
                                .read<AuthBloc>()
                                .forgotPasswordController
                                .text,
                            context: context));
                      } else {
                        print("Not Correct");
                        return;
                      }
                    });
              }),
            ],
          ),
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
            controller: context.read<AuthBloc>().forgotPasswordController,
            decoration: InputDecoration(
              // suffix: TextButton(
              //   child: const Text("Reset Password"),
              //   onPressed: () {
              //     context.read<AuthBloc>().add(ResetPasswordEvent(
              //         email: context.read<AuthBloc>().emailController.text,
              //         context: context));
              //   },
              // ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 2,
                  color: ColorAndFont.GREEN,
                ),
              ),
            ),
            validator: (value) {
              String email =
                  context.read<AuthBloc>().forgotPasswordController.text;
              final emailRegex =
                  RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');

              if (email == "" || !emailRegex.hasMatch(email)) {
                return "Enter a valid Email address";
              } else {
                return null;
              }
            }),
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