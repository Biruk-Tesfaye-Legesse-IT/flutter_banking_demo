part of 'transaction_bloc.dart';

@immutable
abstract class TransactionEvent {}

class WithdrawEvent extends TransactionEvent {
  final String email;
  final String password;

  WithdrawEvent({required this.email, required this.password});
}

class TransferEvent extends TransactionEvent {
  final String email;
  final String password;

  TransferEvent({required this.email, required this.password});
}

// class Event extends TransactionEvent {
//   final String email;
//   final String password;

//   TransferEvent({required this.email, required this.password});
// }
