import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lottie/lottie.dart';
import 'package:pandora_front/model/weather_model.dart';
import 'package:pandora_front/services/weather_service.dart';

import '../constants.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  static String API_OPEN_WEATHER_MAP_KEY =
      dotenv.env['API_OPEN_WEATHER_MAP_KEY']!;
  final _weatherService = WeatherService(API_OPEN_WEATHER_MAP_KEY);
  Weather? _weather;

  _fetchWeather() async {

    try {
      final weather = await _weatherService.getCurrentWeather();

      setState(() {
        _weather = weather;
      });
    } catch (e) {
      myShowDialog(context, e.toString());
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

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myFifthColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.pin_drop_sharp,
              color: myActiveColor,
              size: 40,
            ),
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
