part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginEvent extends AuthEvent {
  final LoginModel login;
  final BuildContext context;
  LoginEvent({required this.login, required this.context});
}

class RegistrationEvent extends AuthEvent {
  final RegistrationModel registration;
  final BuildContext context;
  RegistrationEvent({required this.registration, required this.context});
}

class VerifyEmailEvent extends AuthEvent {}

class ResetPasswordEvent extends AuthEvent {
  final String email;
  final BuildContext context;
  ResetPasswordEvent({required this.email, required this.context});
}

class VerifyPhoneNoEvent extends AuthEvent {
  final int phoneNo;
  final BuildContext context;
  VerifyPhoneNoEvent({required this.phoneNo, required this.context});
}

class VerifyOtpEvent extends AuthEvent {
  final String otpCode;
  final String verificationId;
  final BuildContext context;
  VerifyOtpEvent(
      {required this.otpCode,
      required this.context,
      required this.verificationId});
}

class ChangeOtpValueEvent extends AuthEvent {
  final String otpCode;
  ChangeOtpValueEvent({required this.otpCode});
}
