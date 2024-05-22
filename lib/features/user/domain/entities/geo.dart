import 'package:equatable/equatable.dart';

class Geo extends Equatable {
  final String lat;
  final String lng;

  Geo({required this.lat, required this.lng});

  @override
  List<Object?> get props => [lat, lng];
}
