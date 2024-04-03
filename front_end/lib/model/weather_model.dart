class Weather {
  final String cityName;
  final double temperature;
  final double temperatureMin;
  final double temperatureMax;
  final double pressure;
  final double humidity;
  final String mainCondition;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.temperatureMin,
    required this.temperatureMax,
    required this.pressure,
    required this.humidity,
    required this.mainCondition,
});

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      temperatureMin: json['main']['temp_min'].toDouble(),
      temperatureMax: json['main']['temp_max'].toDouble(),
      pressure: json['main']['pressure'].toDouble(),
      humidity: json['main']['humidity'].toDouble(),
      mainCondition: json['weather'][0]['main'],
    );
  }
}