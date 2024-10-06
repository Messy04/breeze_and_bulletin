import 'package:breeze_and_bulletin/feature/weather/domain/entity/current_weather_entity.dart';
import 'package:equatable/equatable.dart';

class WeatherForecastEntity extends Equatable {
  final List<ForecastDayEntity>? forecastDay;

  const WeatherForecastEntity({
    this.forecastDay,
  });

  @override
  List<Object?> get props => [];
}

class ForecastDayEntity extends Equatable {
  final DateTime? date;
  final int? dateEpoch;
  final DayEntity? day;
  final AstroEntity? astro;
  final List<CurrentWeatherEntity>? hour;

  const ForecastDayEntity({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
    this.hour,
  });

  @override
  List<Object?> get props => [
        date,
        dateEpoch,
        day,
        astro,
        hour,
      ];
}

class DayEntity extends Equatable {
  final double? maxtempC;
  final double? maxtempF;
  final double? mintempC;
  final double? mintempF;
  final double? avgtempC;
  final double? avgtempF;
  final int? maxwindMph;
  final double? maxwindKph;
  final double? totalprecipMm;
  final double? totalprecipIn;
  final int? totalsnowCm;
  final int? avgvisKm;
  final int? avgvisMiles;
  final int? avghumidity;
  final int? dailyWillItRain;
  final int? dailyChanceOfRain;
  final int? dailyWillItSnow;
  final int? dailyChanceOfSnow;
  final ConditionEntity? condition;
  final int? uv;

  const DayEntity({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.totalsnowCm,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  @override
  List<Object?> get props => [
        maxtempC,
        maxtempF,
        mintempC,
        mintempF,
        avgtempC,
        avgtempF,
        maxwindMph,
        maxwindKph,
        totalprecipMm,
        totalprecipIn,
        totalsnowCm,
        avgvisKm,
        avgvisMiles,
        avghumidity,
        dailyWillItRain,
        dailyChanceOfRain,
        dailyWillItSnow,
        dailyChanceOfSnow,
        condition,
        uv,
      ];
}

class AstroEntity extends Equatable {
  final String? sunrise;
  final String? sunset;
  final String? moonrise;
  final String? moonset;
  final String? moonPhase;
  final int? moonIllumination;
  final int? isMoonUp;
  final int? isSunUp;

  const AstroEntity({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
    this.isMoonUp,
    this.isSunUp,
  });

  @override
  List<Object?> get props => [
        sunrise,
        sunset,
        moonrise,
        moonset,
        moonPhase,
        moonIllumination,
        isMoonUp,
        isSunUp,
      ];
}
