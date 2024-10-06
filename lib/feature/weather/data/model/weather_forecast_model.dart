import 'dart:convert';

import 'package:breeze_and_bulletin/feature/weather/data/model/current_weather_model.dart';
import 'package:breeze_and_bulletin/feature/weather/domain/entity/weather_forecast_entity.dart';

class WeatherForecastModel extends WeatherForecastEntity {
  final List<ForecastDayModel>? forecastDay;

  const WeatherForecastModel({
    this.forecastDay,
  });

  factory WeatherForecastModel.fromRawJson(String str) =>
      WeatherForecastModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WeatherForecastModel.fromJson(Map<String, dynamic> json) =>
      WeatherForecastModel(
        forecastDay: json["forecastday"] == null
            ? []
            : List<ForecastDayModel>.from(
                json["forecastday"]!.map((x) => ForecastDayModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "forecastday": forecastDay == null
            ? []
            : List<dynamic>.from(forecastDay!.map((x) => x.toJson())),
      };
}

class ForecastDayModel extends ForecastDayEntity {
  final DateTime? date;
  final int? dateEpoch;
  final DayModel? day;
  final AstroModel? astro;
  final List<CurrentWeatherModel>? hour;

  const ForecastDayModel({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
    this.hour,
  });

  factory ForecastDayModel.fromRawJson(String str) =>
      ForecastDayModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) =>
      ForecastDayModel(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        dateEpoch: json["date_epoch"],
        day: json["day"] == null ? null : DayModel.fromJson(json["day"]),
        astro:
            json["astro"] == null ? null : AstroModel.fromJson(json["astro"]),
        hour: json["hour"] == null
            ? []
            : List<CurrentWeatherModel>.from(
                json["hour"]!.map((x) => CurrentWeatherModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "date_epoch": dateEpoch,
        "day": day?.toJson(),
        "astro": astro?.toJson(),
        "hour": hour == null
            ? []
            : List<dynamic>.from(hour!.map((x) => x.toJson())),
      };
}

class DayModel extends DayEntity {
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
  final ConditionModel? condition;
  final int? uv;

  const DayModel({
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

  factory DayModel.fromRawJson(String str) =>
      DayModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DayModel.fromJson(Map<String, dynamic> json) => DayModel(
        maxtempC: json["maxtemp_c"]?.toDouble(),
        maxtempF: json["maxtemp_f"]?.toDouble(),
        mintempC: json["mintemp_c"]?.toDouble(),
        mintempF: json["mintemp_f"]?.toDouble(),
        avgtempC: json["avgtemp_c"]?.toDouble(),
        avgtempF: json["avgtemp_f"]?.toDouble(),
        maxwindMph: json["maxwind_mph"],
        maxwindKph: json["maxwind_kph"]?.toDouble(),
        totalprecipMm: json["totalprecip_mm"]?.toDouble(),
        totalprecipIn: json["totalprecip_in"]?.toDouble(),
        totalsnowCm: json["totalsnow_cm"],
        avgvisKm: json["avgvis_km"],
        avgvisMiles: json["avgvis_miles"],
        avghumidity: json["avghumidity"],
        dailyWillItRain: json["daily_will_it_rain"],
        dailyChanceOfRain: json["daily_chance_of_rain"],
        dailyWillItSnow: json["daily_will_it_snow"],
        dailyChanceOfSnow: json["daily_chance_of_snow"],
        condition: json["condition"] == null
            ? null
            : ConditionModel.fromJson(json["condition"]),
        uv: json["uv"],
      );

  Map<String, dynamic> toJson() => {
        "maxtemp_c": maxtempC,
        "maxtemp_f": maxtempF,
        "mintemp_c": mintempC,
        "mintemp_f": mintempF,
        "avgtemp_c": avgtempC,
        "avgtemp_f": avgtempF,
        "maxwind_mph": maxwindMph,
        "maxwind_kph": maxwindKph,
        "totalprecip_mm": totalprecipMm,
        "totalprecip_in": totalprecipIn,
        "totalsnow_cm": totalsnowCm,
        "avgvis_km": avgvisKm,
        "avgvis_miles": avgvisMiles,
        "avghumidity": avghumidity,
        "daily_will_it_rain": dailyWillItRain,
        "daily_chance_of_rain": dailyChanceOfRain,
        "daily_will_it_snow": dailyWillItSnow,
        "daily_chance_of_snow": dailyChanceOfSnow,
        "condition": condition?.toJson(),
        "uv": uv,
      };
}

class AstroModel extends AstroEntity {
  final String? sunrise;
  final String? sunset;
  final String? moonrise;
  final String? moonset;
  final String? moonPhase;
  final int? moonIllumination;
  final int? isMoonUp;
  final int? isSunUp;

  const AstroModel({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
    this.isMoonUp,
    this.isSunUp,
  });

  factory AstroModel.fromRawJson(String str) =>
      AstroModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AstroModel.fromJson(Map<String, dynamic> json) => AstroModel(
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        moonPhase: json["moon_phase"],
        moonIllumination: json["moon_illumination"],
        isMoonUp: json["is_moon_up"],
        isSunUp: json["is_sun_up"],
      );

  Map<String, dynamic> toJson() => {
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "moon_phase": moonPhase,
        "moon_illumination": moonIllumination,
        "is_moon_up": isMoonUp,
        "is_sun_up": isSunUp,
      };
}
