class ForecastWeatherModel {
  String? cityName;
  double? temperature;
  double? temperatureMin;
  double? temperatureMax;
  double? pressure;
  double? humidity;
  String? mainCondition;

  ForecastWeatherModel({
    required this.cityName,
    required this.temperature,
    required this.temperatureMin,
    required this.temperatureMax,
    required this.pressure,
    required this.humidity,
    required this.mainCondition,
  });

  ForecastWeatherModel.fromJson(Map<String, dynamic> data){
    cityName = data['name'];
    temperature = data['main']['temp'].toDouble();
    temperatureMin = data['main']['temp_min'].toDouble();
    temperatureMax = data['main']['temp_max'].toDouble();
    pressure = data['main']['pressure'].toDouble();
    humidity = data['main']['humidity'].toDouble();
    mainCondition = data['weather'][0]['main'];
  }

  Object toJson() {
    final Map<String, Object> json = <String, Object>{};

    void addIfPresent(String fieldName, Object? value) {
      if (value != null) {
        json[fieldName] = value;
      }
    }

    addIfPresent('cityName', cityName);
    addIfPresent('temperature', temperature);
    addIfPresent('temperatureMin', temperatureMin);
    addIfPresent('temperatureMax', temperatureMax);
    addIfPresent('pressure', pressure);
    addIfPresent('humidity', humidity);
    addIfPresent('mainCondition', mainCondition);

    return json;
  }

  ForecastWeatherModel.mock(){
    cityName = 'Undefined';
    temperature = 0.0;
    temperatureMin = 0.0;
    temperatureMax = 0.0;
    pressure = 0.0;
    humidity = 0.0;
    mainCondition = 'Undefined';
  }
}