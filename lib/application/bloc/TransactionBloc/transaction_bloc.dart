import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:final_demo/application/bloc/auth_bloc/auth_bloc.dart';
import 'package:final_demo/insfrastructure/insfrastructure.dart';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionRepository transactionRepository;
  TransactionBloc({required this.transactionRepository})
      : super(TransactionInitial());

  @override
  Stream<TransactionState> mapEventToState(
    TransactionEvent event,
  ) async* {
    // ======================== Transfer  ================================================
    if (event is TransferButtonPressed) {
      final amount = event.amount;
      final receiverAccountNumber = event.receiverAccount;

      yield TransferProcessing();

      try {
        var transfer =
            await transactionRepository.transfer(receiverAccountNumber, amount);
        print('$amount and $receiverAccountNumber');
        print(transfer);

        if (transfer != null) {
          yield TransferSuccess(transferMessage: transfer);
        } else {
          yield TransferFailure(
              error: "Something went wrong. Please try again!");
        }
      } catch (error) {
        yield TransferFailure(error: error.toString());
      }
    }

    // ========================  Withdraw  ================================================

    if (event is WithdrawButtonPressed) {
      final amount = event.amount;
      final agentAccount = event.agentAccount;

      yield WithdrawProcessing();

      try {
        var withdraw =
            await transactionRepository.transfer(agentAccount, amount);
        print('$amount and $agentAccount');
        print(withdraw);

        if (withdraw != null) {
          yield WithdrawSuccess(withdrawMessage: withdraw);
        } else {
          yield WithdrawFailure(
              error: "Something went wrong. Please try again!");
        }
      } catch (error) {
        yield WithdrawFailure(error: error.toString());
      }
    }
  }
}
