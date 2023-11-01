
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/padding.dart';
import '../../Business_logic/authentication/bloc/auth_bloc.dart';
import '../common_widget/tittles.dart';
import 'Wigets/button1.dart';
import 'Wigets/right_text.dart';
import 'Wigets/text_with_link.dart';
import 'Wigets/textfield_and_tittle.dart';

class UserLoginScreen extends StatelessWidget {
  const UserLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Paddings.myPadding,
        child: Form(
          key: context.read<AuthBloc>().siginInKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Tittles(tittle: "Sign in"),
              TextFirmFieldWithTitle(
                  textFeildTittle: "Email address",
                  myController: context.read<AuthBloc>().emailController,
                  validatorFunction: () {
                    String email =
                        context.read<AuthBloc>().emailController.text;
                    final emailRegex = RegExp(
                        r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');

                    if (email == "" || !emailRegex.hasMatch(email)) {
                      return "Enter a valid Email address";
                    } else {
                      return null;
                    }
                  }),
              TextFirmFieldWithTitle(
                  textFeildTittle: "Password",
                  myController: context.read<AuthBloc>().passwordController,
                  validatorFunction: () {
                    String password =
                        context.read<AuthBloc>().passwordController.text;
                    if (password == "" || password.length < 6) {
                      return "Enter a valid password";
                    }
                    return null;
                  }),
              const TextRightWidget(rightText: "Forgot password?"),
              Button1(
                  buttonText: "Sign in",
                  buttonPressed: () {
                    final bool val = context
                        .read<AuthBloc>()
                        .siginInKey
                        .currentState!
                        .validate();
                    if (val) {
                      print("Success");
                    } else {
                      print("Not Correct");
                      return;
                    }
                  }),
              const TextWithLink(
                  bottomText: "Sign in with Phone number,",
                  linkText: "OTP Login"),
              const TextWithLink(
                  bottomText: "Are you new to here? then,",
                  linkText: "Register"),
            ],
          ),
        ),
      ),
    );
  }
}
