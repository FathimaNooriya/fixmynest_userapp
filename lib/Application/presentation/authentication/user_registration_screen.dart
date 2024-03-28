import 'package:fix_my_nest_user/Application/presentation/authentication/user_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Domain/Models/authentication/registration_model.dart';
import '../../../core/padding.dart';
import '../../Business_logic/authentication/bloc/auth_bloc.dart';
import '../common_widget/tittles.dart';
import 'Wigets/button1.dart';
import 'Wigets/text_with_link.dart';
import 'Wigets/textfield_and_tittle.dart';
import '../home/home.dart';

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
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                ),
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
                // TextRightWidget(
                //     rightText: "Verify Phone Number?",
                //     navContext: context,
                //     buttonFunction:
                //    UserPhNoVerifyScreen()),
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
                      buttonText: "Register",
                      buttonPressed: () {
                        final bool val = context
                            .read<AuthBloc>()
                            .registerKey
                            .currentState!
                            .validate();
                        if (val) {
                          // print("Registration............. Success");
                          context.read<AuthBloc>().add(RegistrationEvent(
                              registration: RegistrationModel(
                                userName: context
                                    .read<AuthBloc>()
                                    .userNameCotroller
                                    .text
                                    .trim(),
                                userEmail: context
                                    .read<AuthBloc>()
                                    .emailController
                                    .text
                                    .trim(),
                                userPassword: context
                                    .read<AuthBloc>()
                                    .passwordController
                                    .text
                                    .trim(),
                                userPhoneNumber: int.parse(context
                                    .read<AuthBloc>()
                                    .phoneNumController
                                    .text
                                    .trim()),
                              ),
                              context: context));
                        } else {
                          print("Not Correct");
                          return;
                        }
                      });
                }),
                TextWithLink(
                    bottomText: "Already have an account? then,",
                    linkText: "Sign in",
                    navContext: context,
                    buttonFunction: const UserLoginScreen()),
                //  Navigator.of(context).push(MaterialPageRoute(
                // builder: (context) => const UserLoginScreen())).toString(),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
