import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Client extends Equatable {
  const Client({
    // required this.id,
    this.accountNumber,
    this.firstName,
    this.lastName,
    this.fullName,
    this.role,
    this.dob,
    this.address,
    this.isBlocked,
    this.balance,
    this.accountType,
    this.beneficiaries,
  });

  // final int id;
  final int? accountNumber;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? role;
  final String? dob;
  final String? address;
  final bool? isBlocked;
  final double? balance;
  final String? accountType;
  final List<Client>? beneficiaries; // I doubt this just made it to hold space

  @override
  List<Object?> get props => [
        // id,
        accountNumber,
        firstName,
        lastName,
        fullName,
        role,
        dob,
        address,
        isBlocked,
        balance,
        accountType,
        beneficiaries
      ];

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        accountNumber: json['account_number'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        fullName: json['fullname'],
        role: json['role'],
        address: json['address'],
        dob: json['DOB'],
        isBlocked: json['is_blocked'],
        balance: json['balance'],
        accountType: json['account_type'],
        beneficiaries: json['saved'],
      );

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'address': address,
        'DOB': dob,
        'balance': balance,
      };
  @override
  String toString() =>
      'Client { account_number: $accountNumber, first_name: $firstName, last_name: $lastName, fullname: $fullName,role: $role, address: $address, DOB: $dob, is_blocked:$isBlocked, balance:$balance, account_type: $accountType, saved: $beneficiaries}';
}
