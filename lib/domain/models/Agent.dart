import 'package:equatable/equatable.dart';
import 'package:final_demo/domain/models/Client.dart';
import 'package:flutter/material.dart';

@immutable
class Agent extends Equatable {
  Agent({
    this.agentID,
    this.accountNumber,
    required this.firstName,
    required this.lastName,
    this.fullName,
    required this.role, //inferred from sender
    required this.dob,
    required this.email,
    required this.phoneNumber,
    required this.address,
    this.isBlocked, // Can't decide
    required this.budget,
    this.registeredUsers,
  });

  final int? agentID; // Just added this
  final int? accountNumber;
  final String firstName;
  final String lastName;
  final String? fullName;
  final role;
  final String dob;
  final String email;
  final String phoneNumber;
  final String address;
  final bool? isBlocked;
  final double? budget;
  final List? registeredUsers;

  @override
  List<Object?> get props => [
        agentID,
        accountNumber,
        firstName,
        lastName,
        fullName,
        role,
        dob,
        email,
        phoneNumber,
        address,
        isBlocked,
        budget,
        registeredUsers,
      ];

  factory Agent.fromJson(Map<String, dynamic> json) => Agent(
      agentID: json['id'],
      accountNumber: json['account_number'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      fullName: json['fullname'], // Don't know what will be received so...
      role: json['role'],
      address: json['address'],
      dob: json['DOB'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      isBlocked: json['is_blocked'],
      budget: json['budget'],
      registeredUsers: json['registered_clients'] != Null
          ? json['registered_clients']
              .map((account) => Client.fromJson(account))
              .toList()
          : []);

  Map<String, dynamic> toJson() => {
        'id': agentID,
        'account_number': accountNumber,
        'first_name': firstName,
        'last_name': lastName,
        'fullname': fullName,
        'address': address,
        'email': email,
        'role': role,
        'phone_number': phoneNumber,
        'DOB': dob,
        'is_blocked': isBlocked,
        'budget': budget,
        'registered_clients':
            registeredUsers!.map((account) => account.toJson()).toList()
      };
  @override
  String toString() =>
      'Agent { agent_id: $agentID, account_number: $accountNumber, first_name: $firstName, last_name: $lastName, fullname: $fullName,role: $role, address: $address, DOB: $dob, is_blocked: $isBlocked, budget: $budget, registered_users:$registeredUsers}';
}
