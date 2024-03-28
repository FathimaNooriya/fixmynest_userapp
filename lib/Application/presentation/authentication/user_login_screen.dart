import 'package:fix_my_nest_user/Application/presentation/authentication/user_ph_no_verify_screen.dart';
import 'package:fix_my_nest_user/Application/presentation/authentication/user_registration_screen.dart';
import 'package:fix_my_nest_user/Domain/Models/authentication/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/padding.dart';
import '../../Business_logic/authentication/bloc/auth_bloc.dart';
import '../common_widget/tittles.dart';
import 'Wigets/button1.dart';
import 'Wigets/right_text.dart';
import 'Wigets/text_with_link.dart';
import 'Wigets/textfield_and_tittle.dart';
import 'change_password_screen.dart';
import '../home/home.dart';

class UserLoginScreen extends StatelessWidget {
  const UserLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: Paddings.myPadding,
          child: Form(
            key: context.read<AuthBloc>().siginInKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                ),
                const Tittles(tittle: "Sign in"),
                TextFirmFieldWithTitle(
                    textFeildTittle: "Email address",
                    myController: context.read<AuthBloc>().loginEmailController,
                    validatorFunction: () {
                      String email =
                          context.read<AuthBloc>().loginEmailController.text;
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
                    myController: context.read<AuthBloc>().loginPasswordController,
                    validatorFunction: () {
                      String password =
                          context.read<AuthBloc>().loginPasswordController.text;
                      if (password == "" || password.length < 6) {
                        return "Enter a valid password";
                      }
                      return null;
                    }),
                TextRightWidget(
                    rightText: "Forgot password?",
                    navContext: context,
                    buttonFunction: const ChangePasswordScreen()),
                BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
                  if (state is AuthSuccess) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  }
                }, builder: (context, state) {
                  if (state is AuthLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Button1(
                      buttonText: "Sign in",
                      buttonPressed: () {
                        final bool val = context
                            .read<AuthBloc>()
                            .siginInKey
                            .currentState!
                            .validate();
                        if (val) {
                          context.read<AuthBloc>().add(LoginEvent(
                              login: LoginModel(
                                  email: context
                                      .read<AuthBloc>()
                                      .loginEmailController
                                      .text
                                      .trim(),
                                  password: context
                                      .read<AuthBloc>()
                                      .loginPasswordController
                                      .text
                                      .trim()),
                              context: context));
                        } else {
                          print("Not Correct");
                          return;
                        }
                      });
                }),
                TextWithLink(
                  bottomText: "Sign in with Phone number,",
                  linkText: "OTP Login",
                  navContext: context,
                  buttonFunction: const UserPhNoVerifyScreen(),
                  //  Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => const UserRegistrationScreen())).toString(),
                ),
                TextWithLink(
                    bottomText: "Are you new to here? then,",
                    linkText: "Register",
                    navContext: context,
                    buttonFunction: const UserRegistrationScreen()
                    //  Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const UserRegistrationScreen())).toString(),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
