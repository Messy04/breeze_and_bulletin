import 'package:equatable/equatable.dart';

class AirQualityEntity extends Equatable {
  final double? co; // Carbon Monoxide
  final double? no2; // Nitrogen Dioxide
  final double? o3; // Ozone
  final double? so2; // Sulfur Dioxide
  final double? pm25; // Particulate Matter 2.5
  final double? pm10; // Particulate Matter 10
  final int? usEpaIndex; // US EPA Index
  final int? gbDefraIndex; // UK Defra Index

  const AirQualityEntity({
    this.co,
    this.no2,
    this.o3,
    this.so2,
    this.pm25,
    this.pm10,
    this.usEpaIndex,
    this.gbDefraIndex,
  });

  @override
  List<Object?> get props => [
        co,
        no2,
        o3,
        so2,
        pm25,
        pm10,
        usEpaIndex,
        gbDefraIndex,
      ];
}
