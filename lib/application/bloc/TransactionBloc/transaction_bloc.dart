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
    // +++++++++++++++++++++++ Client ++++++++++++++++++++++++++++++++

    // ======================== Transfer  ================================================
    if (event is ClientTransferButtonPressed) {
      final amount = event.amount;
      final receiverAccountNumber = event.receiverAccount;

      yield ClientTransferProcessing();

      try {
        var transfer =
            await transactionRepository.transfer(receiverAccountNumber, amount);
        print('$amount and $receiverAccountNumber');
        print(transfer);

        if (transfer != null) {
          yield ClientTransferSuccess(transferMessage: transfer);
        } else {
          yield ClientTransferFailure(
              error: "Something went wrong. Please try again!");
        }
      } catch (error) {
        yield ClientTransferFailure(error: error.toString());
      }
    }

    // ========================  Withdraw  ================================================

    if (event is ClientWithdrawButtonPressed) {
      final amount = event.amount;
      final agentAccount = event.agentAccount;

      yield ClientWithdrawProcessing();

      try {
        var withdraw =
            await transactionRepository.transfer(agentAccount, amount);
        print('$amount and $agentAccount');
        print(withdraw);

        if (withdraw != null) {
          yield ClientWithdrawSuccess(withdrawMessage: withdraw);
        } else {
          yield ClientWithdrawFailure(
              error: "Something went wrong. Please try again!");
        }
      } catch (error) {
        yield ClientWithdrawFailure(error: error.toString());
      }
    }

    // +++++++++++++++++++++++ Agent ++++++++++++++++++++++++++++++++

    if (event is ClientWithdrawButtonPressed) {
      final amount = event.amount;
      final agentAccount = event.agentAccount;

      yield ClientWithdrawProcessing();

      try {
        var withdraw =
            await transactionRepository.transfer(agentAccount, amount);
        print('$amount and $agentAccount');
        print(withdraw);

        if (withdraw != null) {
          yield ClientWithdrawSuccess(withdrawMessage: withdraw);
        } else {
          yield ClientWithdrawFailure(
              error: "Something went wrong. Please try again!");
        }
      } catch (error) {
        yield ClientWithdrawFailure(error: error.toString());
      }
    }

    // +++++++++++++++++++++++ Admin ++++++++++++++++++++++++++++++++
  }
}
