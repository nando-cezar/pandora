import 'package:get/get.dart';
import 'package:pandora_front/app/modules/auth/bindings/auth_binding.dart';
import 'package:pandora_front/app/modules/auth/pages/auth_page.dart';
import 'package:pandora_front/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:pandora_front/app/modules/dashboard/pages/dashboard_page.dart';
import 'package:pandora_front/app/modules/forecast_weather/bindings/forecast_weather_binding.dart';
import 'package:pandora_front/app/modules/forecast_weather/pages/forecast_weather_page.dart';
import 'package:pandora_front/app/modules/forgot_password/bindings/forgot_binding.dart';
import 'package:pandora_front/app/modules/forgot_password/pages/forgot_page.dart';
import 'package:pandora_front/app/modules/initial/bindings/initial_binding.dart';
import 'package:pandora_front/app/modules/initial/pages/initial_page.dart';
import 'package:pandora_front/app/modules/login/bindings/login_binding.dart';
import 'package:pandora_front/app/modules/parameters/bindings/parameters_binding.dart';
import 'package:pandora_front/app/modules/parameters/pages/parameters_page.dart';
import 'package:pandora_front/app/modules/register/bindings/register_binding.dart';
import 'package:pandora_front/app/modules/register/pages/register_page.dart';
import 'package:pandora_front/app/modules/root/bindings/root_binding.dart';
import 'package:pandora_front/app/modules/settings/bindings/settings_binding.dart';
import 'package:pandora_front/app/modules/settings/pages/settings_page.dart';
import 'package:pandora_front/app/modules/world_map/bindings/world_map_binding.dart';
import 'package:pandora_front/app/modules/world_map/pages/world_map_page.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.initial,
      page: () => const InitialPage(),
      bindings: [
        InitialBinding(),
      ],
      participatesInRootNavigator: true,
      children: [
        GetPage(
          name: Routes.authentication,
          page: () => const AuthPage(),
          bindings: [
            AuthBinding(),
            RootBinding(),
            LoginBinding(),
          ],
          participatesInRootNavigator: true,
          middlewares: const [],
        ),
        GetPage(
          name: Routes.register,
          page: () => const RegisterPage(),
          bindings: [
            RegisterBinding(),
          ],
          participatesInRootNavigator: true,
          middlewares: const [],
        ),
        GetPage(
          name: Routes.forgotPassword,
          page: () => const ForgotPasswordPage(),
          bindings: [
            ForgotPasswordBinding(),
          ],
          participatesInRootNavigator: true,
          middlewares: const [],
        ),
        GetPage(
          name: Routes.dashboard,
          page: () => const DashboardPage(),
          bindings: [
            AuthBinding(),
            DashboardBinding(),
          ],
          participatesInRootNavigator: true,
          middlewares: const [],
        ),
        GetPage(
          name: Routes.worldMap,
          page: () => const WorldMapPage(),
          bindings: [
            AuthBinding(),
            WorldMapBinding(),
          ],
          participatesInRootNavigator: true,
          middlewares: const [],
        ),
        GetPage(
          name: Routes.forecastWeather,
          page: () => const ForecastWeatherPage(),
          bindings: [
            AuthBinding(),
            ForecastWeatherBinding(),
          ],
          participatesInRootNavigator: true,
          middlewares: const [],
        ),
        GetPage(
          name: Routes.settings,
          page: () => const SettingsPage(),
          bindings: [
            AuthBinding(),
            SettingsBinding(),
          ],
          children: [
            GetPage(
              name: Routes.parameters,
              page: () => const ParametersPage(),
              bindings: [
                AuthBinding(),
                ParamatersBinding()
              ],
              middlewares: const []
            ),
          ],
          participatesInRootNavigator: true,
          middlewares: const [],
        ),
      ],
    ),
  ];
}

abstract class Routes {
  static const initial = '/';
  static const authentication = '/authentication';
  static const register = '/register';
  static const forgotPassword = '/forgot-password';

  static const dashboard = '/dashboard';
  static const worldMap = '/world-map';
  static const forecastWeather = '/forecast-weather';
  static const settings = '/settings';
  static const parameters = '/parameters';

  static const settingsParameters = settings + parameters;
}
