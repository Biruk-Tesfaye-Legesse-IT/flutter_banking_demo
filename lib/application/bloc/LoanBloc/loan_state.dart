part of 'loan_bloc.dart';

abstract class LoanState extends Equatable {
  const LoanState();
  
  @override
  List<Object> get props => [];
}

class LoanInitial extends LoanState {}
