import 'package:fix_my_nest_user/Application/presentation/authentication/user_login_screen.dart';
import 'package:fix_my_nest_user/Application/presentation/authentication/verify_otp_ph_no.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/color_and_font/color_and_font.dart';
import '../../../core/padding.dart';
import '../../Business_logic/authentication/bloc/auth_bloc.dart';
import '../common_widget/tittles.dart';
import 'Wigets/button1.dart';
import 'Wigets/text_with_link.dart';

class UserPhNoVerifyScreen extends StatelessWidget {
  const UserPhNoVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Paddings.myPadding,
        child: Form(
          key: context.read<AuthBloc>().loginPhnoNoKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Tittles(tittle: "Mobile OTP Login"),
              Padding(
                padding: Paddings.myPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        "Enter the 10 digit mobile number",
                        style: ColorAndFont.SM_TEXT,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller:
                          context.read<AuthBloc>().loginPhoneNoController,
                      validator: (value) {
                        String phoneNo = context
                            .read<AuthBloc>()
                            .loginPhoneNoController
                            .text;
                        if (phoneNo.isEmpty || phoneNo.length != 10) {
                          return "Enter a valid phone number";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 2,
                            color: ColorAndFont.GREEN,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
                if (state is VerifySuccess) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserVerifyPhNoScreen()));
                }
              }, builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Button1(
                    buttonText: "Send OTP",
                    buttonPressed: () {
                      final bool val = context
                          .read<AuthBloc>()
                          .loginPhnoNoKey
                          .currentState!
                          .validate();
                      if (val) {
                        context.read<AuthBloc>().add(VerifyPhoneNoEvent(
                            phoneNo: int.parse(context
                                .read<AuthBloc>()
                                .loginPhoneNoController
                                .text),
                            context: context));
                      } else {
                        return;
                      }
                    });
              }),
              TextWithLink(
                  buttonFunction: const UserLoginScreen(),
                  navContext: context,
                  bottomText: "Sign in with Email?",
                  linkText: "Sign in"),
            ],
          ),
        ),
      ),
    );
  }
}
