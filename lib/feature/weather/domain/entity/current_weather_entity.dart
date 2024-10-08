import 'package:breeze_and_bulletin/feature/aqi/domain/entity/air_quality_entity.dart';
import 'package:equatable/equatable.dart';

class CurrentWeatherEntity extends Equatable {
  final int? lastUpdatedEpoch;
  final String? lastUpdated;
  final double? tempC;
  final double? tempF;
  final int? isDay;
  final ConditionEntity? condition;
  final double? windMph;
  final double? windKph;
  final int? windDegree;
  final String? windDir;
  final double? pressureMb;
  final double? pressureIn;
  final double? precipMm;
  final double? precipIn;
  final int? humidity;
  final int? cloud;
  final double? feelslikeC;
  final double? feelslikeF;
  final double? windchillC;
  final double? windchillF;
  final double? heatindexC;
  final double? heatindexF;
  final double? dewpointC;
  final double? dewpointF;
  final double? visKm;
  final double? visMiles;
  final num? uv;
  final double? gustMph;
  final double? gustKph;
  final int? timeEpoch;
  final String? time;
  final double? snowCm;
  final int? willItRain;
  final int? chanceOfRain;
  final int? willItSnow;
  final int? chanceOfSnow;
  final double? shortRad;
  final double? diffRad;
  final AirQualityEntity? airQuality;

  const CurrentWeatherEntity({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
    this.timeEpoch,
    this.time,
    this.snowCm,
    this.willItRain,
    this.chanceOfRain,
    this.willItSnow,
    this.chanceOfSnow,
    this.shortRad,
    this.diffRad,
    this.airQuality,
  });

  @override
  List<Object?> get props => [
        lastUpdatedEpoch,
        lastUpdated,
        tempC,
        tempF,
        isDay,
        condition,
        windMph,
        windKph,
        windDegree,
        windDir,
        pressureMb,
        pressureIn,
        precipMm,
        precipIn,
        humidity,
        cloud,
        feelslikeC,
        feelslikeF,
        windchillC,
        windchillF,
        heatindexC,
        heatindexF,
        dewpointC,
        dewpointF,
        visKm,
        visMiles,
        uv,
        gustMph,
        gustKph,
        timeEpoch,
        time,
        snowCm,
        willItRain,
        chanceOfRain,
        willItSnow,
        chanceOfSnow,
        shortRad,
        diffRad,
        airQuality,
      ];
}

class ConditionEntity extends Equatable {
  final String? text;
  final String? icon;
  final int? code;

  const ConditionEntity({
    this.text,
    this.icon,
    this.code,
  });

  @override
  List<Object?> get props => [
        text,
        icon,
        code,
      ];
}
