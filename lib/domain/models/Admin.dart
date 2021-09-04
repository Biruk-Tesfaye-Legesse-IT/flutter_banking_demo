import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Admin extends Equatable {
  Admin(
      // Since we need all the information to return and we don't send any
      // requests with this model I assume everything is required
      {
    required this.id,
    required this.accountNumber,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.role,
    required this.dob,
    required this.address,
    required this.isBlocked, //who's gonna block admin tho?
  });

  final int id;
  final int accountNumber;
  final String firstName;
  final String lastName;
  final String fullName;
  final String role;
  final String dob;
  final String address;
  final bool isBlocked;

  @override
  List<Object> get props =>
      [id, firstName, lastName, fullName, role, dob, address, isBlocked];

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
        id: json['admin_id'],
        accountNumber: json['account_number'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        fullName: json['fullname'], // Don't know what will be received so...
        role: json['role'],
        address: json['address'],
        dob: json['DOB'],
        isBlocked: json['is_blocked']);
  }

  @override
  String toString() =>
      'Admin { admin_id: $id, first_name: $firstName, last_name: $lastName, fullname: $fullName,role: $role, address: $address, DOB: $dob, is_blocked:$isBlocked}';
}
