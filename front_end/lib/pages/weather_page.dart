import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lottie/lottie.dart';
import 'package:pandora_front/model/location_model.dart';
import 'package:pandora_front/model/weather_model.dart';
import 'package:pandora_front/services/weather_service.dart';

import '../constants.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  static String BASE_OPEN_WEATHER_MAP_KEY = dotenv.env['API_OPEN_WEATHER_MAP_KEY']!;
  static String BASE_OPEN_CAGE_DATA_KEY = dotenv.env['API_OPEN_CAGE_DATA_KEY']!;
  final _weatherService = WeatherService(BASE_OPEN_WEATHER_MAP_KEY, BASE_OPEN_CAGE_DATA_KEY);
  Weather? _weather;

  _fetchWeather() async {

    Location location = await _weatherService.getCurrentyCity();

    try {
      final weather = await _weatherService.getWeather(location.address);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      ErrorMessage(e.toString());
    }
  }

  String getWeatherAnimation(String? mainCondition) {
    if(mainCondition == null) return 'assets/sunny.json';

    switch (mainCondition.toLowerCase()){
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloud.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/rain.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  void ErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.blueAccent,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      backgroundColor: myDefaultBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_weather?.cityName ?? "loading city..."),
            Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
            Text('${_weather?.temperature.round()} °C'),
            Text(_weather?.mainCondition ?? ""),
          ],
        ),
      ),
    );
  }
}
