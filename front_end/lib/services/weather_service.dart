import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import '../model/location_model.dart';
import '../model/weather_model.dart';

class WeatherService {
  static String API_OPEN_WEATHER_MAP_URL = dotenv.env['API_OPEN_WEATHER_MAP_URL']!;
  static String API_OPEN_CAGE_DATA_URL = dotenv.env['API_OPEN_CAGE_DATA_URL']!;
  final String apiOpenWeatherKey;
  final String apiOpenCaseKey;

  WeatherService(this.apiOpenWeatherKey, this.apiOpenCaseKey);

  Future<Weather> getWeather(String address) async {

    final response = await http.get(Uri.parse('$API_OPEN_WEATHER_MAP_URL?q=$address&appid=$apiOpenWeatherKey&units=metric'));

    if(response.statusCode == 200){
      return Weather.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to load weather data.');
    }
  }

  Future<Location> getCurrentyCity() async {

    LocationPermission permission = await Geolocator.checkPermission();

    if(permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    final response = await http.get(Uri.parse('$API_OPEN_CAGE_DATA_URL?q=${position.latitude},${position.longitude}&key=$apiOpenCaseKey'));

    if(response.statusCode == 200){
      return Location.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to load location data.');
    }
  }
}