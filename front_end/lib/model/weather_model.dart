class WeatherModel {
  final String? cityName;
  final double? temperature;
  final double? temperatureMin;
  final double? temperatureMax;
  final double? pressure;
  final double? humidity;
  final String? mainCondition;

  WeatherModel({
    this.cityName,
    this.temperature,
    this.temperatureMin,
    this.temperatureMax,
    this.pressure,
    this.humidity,
    this.mainCondition,
});

  factory WeatherModel.fromJson(Map<String, dynamic> json){
    return WeatherModel(
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