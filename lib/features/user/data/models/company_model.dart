import 'package:flutter_api/features/user/domain/entities/company.dart';

class CompanyModel extends Company {
  CompanyModel({
    required String name,
    required String catchPhrase,
    required String bs,
  }) : super(
          name: name,
          catchPhrase: catchPhrase,
          bs: bs,
        );

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}