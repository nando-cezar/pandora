class Weather {
  final String cityName;
  final double temperature;
  final double temperature_min;
  final double temperature_max;
  final double pressure;
  final double humidity;
  final String mainCondition;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.temperature_min,
    required this.temperature_max,
    required this.pressure,
    required this.humidity,
    required this.mainCondition,
});

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      temperature_min: json['main']['temp_min'].toDouble(),
      temperature_max: json['main']['temp_max'].toDouble(),
      pressure: json['main']['pressure'].toDouble(),
      humidity: json['main']['humidity'].toDouble(),
      mainCondition: json['weather'][0]['main'],
    );
  }
}