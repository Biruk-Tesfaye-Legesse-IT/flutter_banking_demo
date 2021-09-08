part of 'transaction_bloc.dart';

@immutable
abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class TransferButtonPressed extends TransactionEvent {
  final String receiverAccount;
  final double amount;

  TransferButtonPressed({required this.amount, required this.receiverAccount});

  @override
  List<Object> get props => [amount, receiverAccount];

  @override
  String toString() =>
      'TransferButtonPressed { email: $amount, password: $receiverAccount }';
}

class WithdrawButtonPressed extends TransactionEvent {
  final String agentAccount;
  final double amount;

  WithdrawButtonPressed({required this.amount, required this.agentAccount});

  @override
  List<Object> get props => [amount, agentAccount];

  @override
  String toString() =>
      'WithdrawButtonPressed { email: $amount, password: $agentAccount }';
}
