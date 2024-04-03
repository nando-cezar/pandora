import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lottie/lottie.dart';
import 'package:pandora_front/model/weather_model.dart';
import 'package:pandora_front/services/weather_service.dart';

import '../constants.dart';
import 'loading_page.dart';

class WeatherPage extends StatelessWidget {
  WeatherPage({super.key});

  static String API_OPEN_WEATHER_MAP_KEY =
      dotenv.env['API_OPEN_WEATHER_MAP_KEY']!;
  final WeatherService _weatherService =
      WeatherService(API_OPEN_WEATHER_MAP_KEY);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: FutureBuilder<Weather>(
          future: _weatherService.getCurrentWeather(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingPage();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final weather = snapshot.data;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.pin_drop_sharp,
                    color: myActiveColor,
                    size: 40,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    weather?.cityName ?? "Loading...",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 100),
                  Lottie.asset(
                    getWeatherAnimation(weather?.mainCondition),
                  ),
                  const SizedBox(height: 100),
                  Text(
                    '${weather?.temperature.round()} °C',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    weather?.mainCondition ?? "",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
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
}
