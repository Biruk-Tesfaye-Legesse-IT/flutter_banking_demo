import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Loan extends Equatable {
  Loan({
    this.loanID,
    required this.accountNumber,
    required this.amountTaken,
    // required this.amountPaid,
    required this.amountRemaining,
    required this.isActive,
    this.dateTaken,
    required this.dueDate,
  });

  final int? loanID;
  final String accountNumber;
  final double amountTaken;
  // final double amountPaid;
  final double amountRemaining;
  final bool isActive;
  final String? dateTaken; // If there is no operation it can stay a string
  final String dueDate;

  @override
  List<Object?> get props => [
        loanID,
        accountNumber,
        amountTaken,
        // amountPaid,
        amountRemaining,
        isActive,
        dateTaken,
        dueDate,
      ];

  factory Loan.fromJson(Map<String, dynamic> json) => Loan(
        loanID: json['id'],
        accountNumber: json['account_number'],
        amountTaken: json['amount_taken'],
        // amountPaid: json['amount_paied'], // Conformed to the spelling error
        amountRemaining: json['amount_remaining'],
        isActive: json['is_active'],
        dueDate: json['due_date'],
      );

  @override
  String toString() =>
      'Loan { id: , client_id: , amount_taken: , amount_paied: , amount_remaining: , is_active: , due_date: }';
}
