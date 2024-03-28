import 'package:fix_my_nest_user/Application/presentation/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/color_and_font/color_and_font.dart';
import '../../../core/padding.dart';
import '../../Business_logic/authentication/bloc/auth_bloc.dart';
import '../common_widget/tittles.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: ColorAndFont.GREEN,
                  showFieldAsBox: true,
                  onSubmit: (String OTPcode) {
                    print(
                        "....................////////////////.....................");
                    print(OTPcode);
                    context
                        .read<AuthBloc>()
                        .add(ChangeOtpValueEvent(otpCode: OTPcode));
                    context.read<AuthBloc>().add(VerifyOtpEvent(
                        otpCode: OTPcode,
                        context: context,
                        verificationId:
                            context.read<AuthBloc>().phoneVerificationId));
                  },
                ),
                // OtpTextfield(),
                // OtpTextfield(),
                // OtpTextfield(),
                // OtpTextfield(),
                // OtpTextfield(),
                // OtpTextfield(),
              ],
            ),
            BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
              if (state is VerifySuccess) {
                print("veryfy success");
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("Verified OTP")));
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              } else if (state is VerifyFailed) {
                print("veryfy failed");
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("OTP Failed")));
              }
            }, builder: (context, state) {
              if (state is AuthLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Button1(
                buttonText: "Verify OTP",
                buttonPressed: () {
                  context.read<AuthBloc>().add(VerifyOtpEvent(
                      verificationId:
                          context.read<AuthBloc>().phoneVerificationId,
                      otpCode: context.read<AuthBloc>().otpValue,
                      context: context));
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

class OtpTextfield1 extends StatelessWidget {
  const OtpTextfield1({
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
