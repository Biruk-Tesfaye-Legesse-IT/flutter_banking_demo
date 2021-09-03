import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Loan extends Equatable {
  Loan({
    required this.loanID,
    required this.clientID,
    required this.amountTaken,
    required this.amountPaid,
    required this.amountRemaining,
    required this.isActive,
    required this.dueDate,
  });

  final int loanID;
  final String clientID;
  final double amountTaken;
  final double amountPaid;
  final double amountRemaining;
  final bool isActive;
  final String dueDate;

  @override
  List<Object> get props => [
        loanID,
        clientID,
        amountTaken,
        amountPaid,
        amountRemaining,
        isActive,
        dueDate,
      ];

  factory Loan.fromJson(Map<String, dynamic> json) {
    return Loan(
      loanID: json['id'],
      clientID: json['client_id'],
      amountTaken: json['amount_taken'],
      amountPaid: json['amount_paied'], // Conformed to the spelling error
      amountRemaining: json['amount_remaining'],
      isActive: json['is_active'],
      dueDate: json['due_date'],
    );
  }

  @override
  String toString() =>
      'Loan { id: $loanID, client_id: $clientID, amount_taken: $amountTaken, amount_paied: $amountPaid, amount_remaining: $amountRemaining, is_active: $isActive, due_date: $dueDate}';
}
