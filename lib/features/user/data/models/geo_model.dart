import 'package:flutter_api/features/user/domain/entities/geo.dart';
class GeoModel extends Geo {
  GeoModel({
    required String lat,
    required String lng,
  }) : super(
          lat: lat,
          lng: lng,
        );

  factory GeoModel.fromJson(Map<String, dynamic> json) => GeoModel(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
