import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_demo/application/bloc/LoginBloc/login_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(LoggedOut());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is LoginEvent) {
      final email = event.email;
      final password = event.password;

      // reaching to the backend
      yield LoginInprogress();
      await Future.delayed(Duration(seconds: 1));

      if (email == "a") {
        if (password == "s") {
          // login successfuly
          yield LoggedIn();
        } else {
          // wrong password
          yield AuthFailed(errorMsg: 'Wrong password');
        }
      } else {
        // account doesn't exists
        yield AuthFailed(errorMsg: 'Account does not exist');
      }
    }
  }
}
