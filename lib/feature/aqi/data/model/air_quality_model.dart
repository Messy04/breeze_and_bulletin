import 'package:breeze_and_bulletin/feature/aqi/domain/entity/air_quality_entity.dart';

class AirQualityModel extends AirQualityEntity {
  final double? co; // Carbon monoxide
  final double? no2; // Nitrogen dioxide
  final double? o3; // Ozone
  final double? so2; // Sulfur dioxide
  final double? pm25; // Particulate Matter 2.5
  final double? pm10; // Particulate Matter 10
  final int? usEpaIndex; // US EPA Air Quality Index
  final int? gbDefraIndex; // UK DEFRA Air Quality Index

  const AirQualityModel({
    this.co,
    this.no2,
    this.o3,
    this.so2,
    this.pm25,
    this.pm10,
    this.usEpaIndex,
    this.gbDefraIndex,
  });

  // Create an instance from JSON
  factory AirQualityModel.fromJson(Map<String, dynamic> json) {
    return AirQualityModel(
      co: json['co']?.toDouble(),
      no2: json['no2']?.toDouble(),
      o3: json['o3']?.toDouble(),
      so2: json['so2']?.toDouble(),
      pm25: json['pm2_5']?.toDouble(),
      pm10: json['pm10']?.toDouble(),
      usEpaIndex: json['us-epa-index'],
      gbDefraIndex: json['gb-defra-index'],
    );
  }

  // Convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'co': co,
      'no2': no2,
      'o3': o3,
      'so2': so2,
      'pm2_5': pm25,
      'pm10': pm10,
      'us-epa-index': usEpaIndex,
      'gb-defra-index': gbDefraIndex,
    };
  }
}
