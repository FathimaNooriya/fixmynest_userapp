import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../Domain/Models/authentication/login_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> siginInKey = GlobalKey<FormState>();
  final TextEditingController userNameCotroller = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();

  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthState(
          isSaving: true,
          //  authResults: AuthResults.initial,
          isLogin: true));
      //   AuthResults authResults = await AuthRepository.signInWithEmail(
      //       email: event.login.email, password: event.login.password);
      return emit(AuthState(
          isSaving: false,
          // authResults: authResults,
          isLogin: true));
    });
  }
}
