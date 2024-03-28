import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../Domain/Models/authentication/login_model.dart';
import '../../../../Domain/Models/authentication/registration_model.dart';
import '../../../presentation/utils/login_repository.dart';
import '../../../presentation/utils/phone_repository.dart';
import '../../../presentation/utils/reset_password.dart';
import '../../../presentation/utils/registration_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final TextEditingController loginPhoneNoController = TextEditingController();
  final GlobalKey<FormState> siginInKey = GlobalKey<FormState>();
  final TextEditingController userNameCotroller = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  final TextEditingController forgotPasswordController =
      TextEditingController();
  final GlobalKey<FormState> resetPasswordKey = GlobalKey<FormState>();
  final GlobalKey<FormState> loginPhnoNoKey = GlobalKey<FormState>();
  String otpValue = "";
  String phoneVerificationId = '';

  AuthBloc() : super(AuthInitial()) {
    on<RegistrationEvent>(registrationEvent);
    on<LoginEvent>(loginEvent);
    on<ResetPasswordEvent>(resetPasswordEvent);
    on<VerifyPhoneNoEvent>(verifyPhoneNoEvent);
    on<VerifyOtpEvent>(verifyOtpEvent);
    on<ChangeOtpValueEvent>(changeOtpValueEvent);
  }

  FutureOr<void> registrationEvent(
      RegistrationEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await RegistrationRepo.registration(
        registration: event.registration, context: event.context);
    result.contains('Registration Successful')
        ? {
            emit(AuthSuccess(authResults: result)),
            userNameCotroller.clear(),
            passwordController.clear(),
            emailController.clear(),
            phoneNumController.clear(),
          }
        : emit(AuthError(authResults: result));
  }

  FutureOr<void> loginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await LoginRepository.login(
        loginModel: event.login, context: event.context);
    result.contains('You are Logged in')
        ? {
            emit(AuthSuccess(authResults: result)),
            loginEmailController.clear(),
            loginPasswordController.clear(),
          }
        : emit(AuthError(authResults: result));
  }

  Future<FutureOr<void>> resetPasswordEvent(
      ResetPasswordEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await ResetPasswordRepo.resetPassword(
        email: event.email, context: event.context);
    result.contains("Send reset password email")
        ? {
            emit(VerifySuccess()),
            forgotPasswordController.clear(),
          }
        : emit(VerifyFailed());
  }

  FutureOr<void> verifyPhoneNoEvent(
      VerifyPhoneNoEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    phoneVerificationId = await PhoneNumberRepository.verifyPhoneNumber(
        phoneNo: event.phoneNo, context: event.context);
    print("....................Send OTP...................");
    print(phoneVerificationId);
    phoneVerificationId == ""
        ? emit(VerifyFailed())
        : {
            emit(VerifySuccess()),
            loginPhoneNoController.clear(),
          };
  }

  FutureOr<void> verifyOtpEvent(
      VerifyOtpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    bool result = await PhoneNumberRepository.verifyOtp(
        verificationId: event.verificationId,
        otp: event.otpCode,
        context: event.context);
    print(result);
    result == true ? emit(VerifySuccess()) : emit(VerifyFailed());
  }

  FutureOr<void> changeOtpValueEvent(
      ChangeOtpValueEvent event, Emitter<AuthState> emit) {
    otpValue = event.otpCode;
  }
}
