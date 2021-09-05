part of 'loan_bloc.dart';

abstract class LoanEvent extends Equatable {
  const LoanEvent();

  @override
  List<Object> get props => [];
}

class LoanRequest extends LoanEvent {
  final double amount;

  LoanRequest({required this.amount});
}

class ViewLoanInfo extends LoanEvent {}

class PayLoan extends LoanEvent {
  final double amount;

  PayLoan({required this.amount});
}
