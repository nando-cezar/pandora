import 'package:pandora_front/app/data/model/forecast_weather_model.dart';
import 'package:pandora_front/app/data/provider/forecast_weather_provider.dart';

class ForecastWeatherRepository {
  final ForecastWeatherProvider forecastWeatherProvider;

  ForecastWeatherRepository({required this.forecastWeatherProvider});

  Future<ForecastWeatherModel> getCurrentForecastWeather({latitude, longitude, token}) {
      return forecastWeatherProvider.getCurrentForecastWeather(latitude, longitude, token);
  }
}