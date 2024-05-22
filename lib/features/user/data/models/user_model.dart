import 'package:flutter_api/features/user/data/models/address_model.dart';
import 'package:flutter_api/features/user/data/models/company_model.dart';
import 'package:flutter_api/features/user/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required int id,
    required String name,
    required String username,
    required String email,
    required AddressModel address,
    required String phone,
    required String website,
    required CompanyModel company,
  }) : super(
          id: id,
          name: name,
          username: username,
          email: email,
          address: address,
          phone: phone,
          website: website,
          company: company,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: AddressModel.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company: CompanyModel.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": (address as AddressModel).toJson(),
        "phone": phone,
        "website": website,
        "company": (company as CompanyModel).toJson(),
      };
}
