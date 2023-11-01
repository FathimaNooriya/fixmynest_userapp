part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}
class LoginEvent extends AuthEvent {
  final LoginModel login;
  LoginEvent({required this.login});
}

class VerifyEmailEvent extends AuthEvent {}

class GoogleSignUpEvent extends AuthEvent {}

class PasswordResetEvent extends AuthEvent {
  final String email;
  PasswordResetEvent({required this.email});
}