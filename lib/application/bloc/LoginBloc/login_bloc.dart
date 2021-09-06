import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_demo/application/bloc/AuthBloc/auth_bloc.dart';
import 'package:final_demo/insfrastructure/insfrastructure.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AccountRepository accountRepository;
  final AuthBloc authBloc;

  LoginBloc({required this.accountRepository, required this.authBloc})
      : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      final email = event.email;
      final password = event.password;

      // reaching to the backend
      yield LoginLoading();

      try {
        accountRepository.login(email, password);
        print('$email and $password');

        // authBloc.dispatch(LoggedIn(accountNumber: accountNumber));
        print('what do I do now?');
        // yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}

// if (email == "a") {
      //   if (password == "s") {
      //     // login successfuly
      //     yield LoggedIn();
      //   } else {
      //     // wrong password
      //     yield AuthFailed(errorMsg: 'Wrong password');
      //   }
      // } else {
      //   // account doesn't exists
      //   yield AuthFailed(errorMsg: 'Account does not exist');
      // }
