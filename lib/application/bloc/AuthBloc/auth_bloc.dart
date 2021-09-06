import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_demo/application/bloc/LoginBloc/login_bloc.dart';
import 'package:final_demo/insfrastructure/repository/auth/accountRepository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AccountRepository accountRepository;

  AuthBloc(this.accountRepository) : super(AuthenticationUninitialized());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    int x = 0;
    if (x == 1) {
      yield AuthenticationAuthenticated();
    } else {
      yield AuthenticationUnauthenticated();
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      print("SharedPreferences Populate");
      // await accountRepository.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      print("Shared Preference Cleaned");
      // await accountRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }

  // if (event is LoginEvent) {
  //   final email = event.email;
  //   final password = event.password;

  //   // reaching to the backend
  //   yield LoginInprogress();
  //   await Future.delayed(Duration(seconds: 1));

  //   if (email == "a") {
  //     if (password == "s") {
  //       // login successfuly
  //       yield LoggedIn();
  //     } else {
  //       // wrong password
  //       yield AuthFailed(errorMsg: 'Wrong password');
  //     }
  //   } else {
  //     // account doesn't exists
  //     yield AuthFailed(errorMsg: 'Account does not exist');
  //   }
  // }
}
