class AirQuality {
  final double co; // Carbon monoxide
  final double no2; // Nitrogen dioxide
  final double o3; // Ozone
  final double so2; // Sulfur dioxide
  final double pm2_5; // Particulate Matter 2.5
  final double pm10; // Particulate Matter 10
  final int usEpaIndex; // US EPA Air Quality Index
  final int gbDefraIndex; // UK DEFRA Air Quality Index

  AirQuality({
    required this.co,
    required this.no2,
    required this.o3,
    required this.so2,
    required this.pm2_5,
    required this.pm10,
    required this.usEpaIndex,
    required this.gbDefraIndex,
  });

  // Create an instance from JSON
  factory AirQuality.fromJson(Map<String, dynamic> json) {
    return AirQuality(
      co: json['co'].toDouble(),
      no2: json['no2'].toDouble(),
      o3: json['o3'].toDouble(),
      so2: json['so2'].toDouble(),
      pm2_5: json['pm2_5'].toDouble(),
      pm10: json['pm10'].toDouble(),
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
      'pm2_5': pm2_5,
      'pm10': pm10,
      'us-epa-index': usEpaIndex,
      'gb-defra-index': gbDefraIndex,
    };
  }
}
