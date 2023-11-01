import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/padding.dart';
import '../../Business_logic/authentication/bloc/auth_bloc.dart';
import '../common_widget/tittles.dart';
import 'Wigets/button1.dart';
import 'Wigets/right_text.dart';
import 'Wigets/text_with_link.dart';
import 'Wigets/textfield_and_tittle.dart';

class UserRegistrationScreen extends StatelessWidget {
  const UserRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: Paddings.myPadding,
          child: Form(
            key: context.read<AuthBloc>().registerKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Tittles(tittle: "Register here..."),
                TextFirmFieldWithTitle(
                  textFeildTittle: "Full Name",
                  myController: context.read<AuthBloc>().userNameCotroller,
                  validatorFunction: () {
                    String name =
                        context.read<AuthBloc>().userNameCotroller.text;
                    if (name.isEmpty || name.length < 3) {
                      return "Enter a valid name";
                    }
                    return null;
                  },
                ),
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
                    }
                    return null;
                  },
                ),
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
                  },
                ),
                TextFirmFieldWithTitle(
                  textFeildTittle: "Phone Number",
                  myController: context.read<AuthBloc>().phoneNumController,
                  validatorFunction: () {
                    String phoneNo =
                        context.read<AuthBloc>().phoneNumController.text;
                    if (phoneNo.isEmpty || phoneNo.length != 10) {
                      return "Enter a valid phone number";
                    }
                    return null;
                  },
                ),
                const TextRightWidget(rightText: "Verify Phone Number?"),
                Button1(
                    buttonText: "Register",
                    buttonPressed: () {
                      final bool val = context
                          .read<AuthBloc>()
                          .registerKey
                          .currentState!
                          .validate();
                      if (val) {
                        print("Registration Success");
                      } else {
                        print("Not Correct");
                        return;
                      }
                    }),
                const TextWithLink(
                    bottomText: "Already have an account? then,",
                    linkText: "Sign in"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
