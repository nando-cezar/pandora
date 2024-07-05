import 'package:flutter_test/flutter_test.dart';
import 'package:pandora_front/app/data/model/forecast_weather_model.dart';

void main() {
  group('ForecastWeatherModel', () {
    test('should create an instance with all properties', () {
      final model = ForecastWeatherModel(
        cityName: 'New York',
        temperature: 20.0,
        temperatureMin: 15.0,
        temperatureMax: 25.0,
        pressure: 1013.0,
        humidity: 80.0,
        mainCondition: 'Clear',
      );

      expect(model.cityName, 'New York');
      expect(model.temperature, 20.0);
      expect(model.temperatureMin, 15.0);
      expect(model.temperatureMax, 25.0);
      expect(model.pressure, 1013.0);
      expect(model.humidity, 80.0);
      expect(model.mainCondition, 'Clear');
    });

    test('should create an instance from JSON', () {
      final json = {
        'name': 'New York',
        'main': {
          'temp': 20.0,
          'temp_min': 15.0,
          'temp_max': 25.0,
          'pressure': 1013.0,
          'humidity': 80.0
        },
        'weather': [
          {'main': 'Clear'}
        ]
      };

      final model = ForecastWeatherModel.fromJson(json);

      expect(model.cityName, 'New York');
      expect(model.temperature, 20.0);
      expect(model.temperatureMin, 15.0);
      expect(model.temperatureMax, 25.0);
      expect(model.pressure, 1013.0);
      expect(model.humidity, 80.0);
      expect(model.mainCondition, 'Clear');
    });

    test('should convert an instance to JSON', () {
      final model = ForecastWeatherModel(
        cityName: 'New York',
        temperature: 20.0,
        temperatureMin: 15.0,
        temperatureMax: 25.0,
        pressure: 1013.0,
        humidity: 80.0,
        mainCondition: 'Clear',
      );

      final json = model.toJson();

      expect(json['cityName'], 'New York');
      expect(json['temperature'], 20.0);
      expect(json['temperatureMin'], 15.0);
      expect(json['temperatureMax'], 25.0);
      expect(json['pressure'], 1013.0);
      expect(json['humidity'], 80.0);
      expect(json['mainCondition'], 'Clear');
    });

    test('should create a mock instance with default values', () {
      final model = ForecastWeatherModel.mock();

      expect(model.cityName, 'Undefined');
      expect(model.temperature, 0.0);
      expect(model.temperatureMin, 0.0);
      expect(model.temperatureMax, 0.0);
      expect(model.pressure, 0.0);
      expect(model.humidity, 0.0);
      expect(model.mainCondition, 'Undefined');
    });
  });
}