import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pandora_front/app/modules/forecast_weather/controllers/forecast_weather_controller.dart';
import 'package:pandora_front/app/routes/app_pages.dart';
import 'package:pandora_front/app/ui/pages/message_page.dart';
import 'package:pandora_front/app/ui/widgets/my_drawer.dart';
import 'package:pandora_front/constants.dart';

class ForecastWeatherPage extends GetView<ForecastWeatherController> {
  const ForecastWeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getCurrentForecastWeather(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MessagePage(message: 'preparing_data'.tr);
        } else if (snapshot.hasError) {
          return MessagePage(
            message: 'error_message'.tr,
          );
        } else {
          return Scaffold(
            appBar: myAppBar(
              onPressed: () => Get.offAllNamed(Routes.dashboard),
            ),
            drawer: const MyDrawer(),
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
                    controller.forecastWeatherModel.cityName!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 100),
                  Lottie.asset(
                    _getWeatherAnimation(
                        controller.forecastWeatherModel.mainCondition),
                  ),
                  const SizedBox(height: 100),
                  Text(
                    '${controller.forecastWeatherModel.temperature?.round()} °C',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    controller.forecastWeatherModel.mainCondition!.tr,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  String _getWeatherAnimation(String? mainCondition) {
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
