part of 'transaction_bloc.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

// ==================Transfer States===========================

class TransferProcessing extends TransactionState {}

class TransferSuccess extends TransactionState {
  final String transferMessage;

  TransferSuccess({required this.transferMessage});
  @override
  List<Object> get props => [transferMessage];
}

class TransferFailure extends TransactionState {
  final String error;

  const TransferFailure({required this.error});

  @override
  List<Object> get props => [error];
//
  @override
  String toString() => 'LoginFailure { error: $error }';
}

// =======================Withdraw States============================

class WithdrawProcessing extends TransactionState {}

class WithdrawSuccess extends TransactionState {
  final withdrawMessage;

  WithdrawSuccess({required this.withdrawMessage});
  @override
  List<Object> get props => [withdrawMessage];
}

class WithdrawFailure extends TransactionState {
  final String error;

  const WithdrawFailure({required this.error});

  @override
  List<Object> get props => [error];
//
  @override
  String toString() => 'LoginFailure { error: $error }';
}
