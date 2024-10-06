import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final String? name;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;
  final String? tzId;
  final int? localtimeEpoch;
  final String? localtime;

  const LocationEntity({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  @override
  List<Object?> get props => [
        name,
        region,
        country,
        lat,
        lon,
        tzId,
        localtimeEpoch,
        localtime,
      ];
}
