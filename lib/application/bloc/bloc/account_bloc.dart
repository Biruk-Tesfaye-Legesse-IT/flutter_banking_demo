import 'dart:async';
import 'package:final_demo/insfrastructure/insfrastructure.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AccountRepository accountRepository;
  // final AuthBloc authBloc;

  AccountBloc({required this.accountRepository}) : super(AccountInitial());

  @override
  Stream<AccountState> mapEventToState(
    AccountEvent event,
  ) async* {
    if (event is GetAccount) {
      yield AccountLoading();

      try {
        var user = await accountRepository.getCurrentUser();

        if (user != null) {
          yield AccountLoaded(user: user);
        } else {
          yield AccountFailed(error: "Failed to load.");
        }
      } catch (error) {
        yield AccountFailed(error: error.toString());
      }
    }
  }
}
