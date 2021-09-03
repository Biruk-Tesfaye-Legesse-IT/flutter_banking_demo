import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class TransactionHistory extends Equatable {
  TransactionHistory({
    this.transactionId,
    this.accountNumber, // I assumed it was account Number but which one??
    this.description, //It says text I assumed it was description
    this.date,
  });

  final int? transactionId;
  final int? accountNumber;
  final String? description;
  final String? date;
  // final String? error;
  // Assuming there is no operation on frontend regarding date

  @override
  List<Object?> get props => [
        transactionId,
        accountNumber,
        description,
        date,
      ];

  // Transactions.withError(String errorMessage) {
  //   error = errorMessage;
  // }

  factory TransactionHistory.fromJson(Map<String, dynamic> json) =>
      TransactionHistory(
        transactionId: json['id'],
        accountNumber: json['account_id'], //assuming that is what it means
        description: json['text'], //assuming that is what it means
        date: json['date'],
      );

  Map<String, dynamic> toJson() => {
        // 'first_name': firstName,
        // 'last_name': lastName,
        // 'address': address,
        // 'DOB': dob,
        // 'balance': balance,
      };

  @override
  String toString() =>
      'History { id: $transactionId, account_id: $accountNumber, text: $description, date: $date}';
}
