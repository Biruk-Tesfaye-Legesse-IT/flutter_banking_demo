import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class TransactionHistory extends Equatable {
  TransactionHistory({
    this.transactionId,
    this.accountNumber,
    required this.relatedAccount,
    required this.transactionType, // I assumed it was account Number but which one??
    this.remark, //It says text I assumed it was description
    this.date,
  });

  final int? transactionId;
  final int? accountNumber;
  final int? relatedAccount;
  final String transactionType;
  final String? remark;

  final String? date;
  // final String? error;
  // Assuming there is no operation on frontend regarding date

  @override
  List<Object?> get props => [
        transactionId,
        accountNumber,
        remark,
        date,
      ];

  // Transactions.withError(String errorMessage) {
  //   error = errorMessage;
  // }

  factory TransactionHistory.fromJson(Map<String, dynamic> json) =>
      TransactionHistory(
        transactionId: json['id'],
        accountNumber: json['account_id'], //assuming that is what it means
        remark: json['text'], //assuming that is what it means
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
