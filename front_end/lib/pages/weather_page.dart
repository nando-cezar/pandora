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
  static String BASE_OPEN_WEATHER_MAP_KEY =
      dotenv.env['API_OPEN_WEATHER_MAP_KEY']!;
  static String BASE_OPEN_CAGE_DATA_KEY = dotenv.env['API_OPEN_CAGE_DATA_KEY']!;
  final _weatherService =
      WeatherService(BASE_OPEN_WEATHER_MAP_KEY, BASE_OPEN_CAGE_DATA_KEY);
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
    if (mainCondition == null) return 'assets/images/sunny.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/images/cloud.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/images/rain.json';
      case 'thunderstorm':
        return 'assets/images/thunder.json';
      case 'clear':
        return 'assets/images/sunny.json';
      default:
        return 'assets/images/sunny.json';
    }
  }

  void ErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: myFirstColor,
          title: Center(
            child: Text(
              message,
              style: TextStyle(
                color: myFifthColor,
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
      backgroundColor: myFifthColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.pin_drop),
            const SizedBox(height: 10),
            Text(
              _weather?.cityName ?? "Loading...",
              style: TextStyle(
                color: myTenthColor,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 100),
            Lottie.asset(
              getWeatherAnimation(_weather?.mainCondition),
            ),
            const SizedBox(height: 100),
            Text(
              '${_weather?.temperature.round()} °C',
              style: TextStyle(
                color: myNinthColor,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              _weather?.mainCondition ?? "",
              style: TextStyle(
                color: myEighthColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
