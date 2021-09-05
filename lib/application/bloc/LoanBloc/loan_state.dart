part of 'loan_bloc.dart';

abstract class LoanState extends Equatable {
  const LoanState();

  @override
  List<Object> get props => [];
}

class LoanInitial extends LoanState {}

class LoanInfoLoading extends LoanState {}

class LoanPaid extends LoanState {}

class LoanPayFailed extends LoanState {
  final String errorMsg;

  LoanPayFailed({required this.errorMsg});
}
