// lib/features/user/domain/entities/user.dart
import 'package:equatable/equatable.dart';
import 'address.dart';
import 'company.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  @override
  List<Object?> get props => [id, name, username, email, address, phone, website, company];
}

