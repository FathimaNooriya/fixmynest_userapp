part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {
  bool isloading = false;
}

class AuthLoading extends AuthState {
  bool isloading = true;
}

class AuthSuccess extends AuthState {
  bool isloading = false;
  final String authResults;
  
  AuthSuccess({required this.authResults});
  
}

class AuthError extends AuthState {
  bool isloading = false;
  final String authResults;
  AuthError({required this.authResults});
}

class VerifySuccess extends AuthState {}

class VerifyFailed extends AuthState {}
