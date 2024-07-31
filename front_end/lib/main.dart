import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pandora_front/app/config/cookie.dart';
import 'package:pandora_front/app/data/provider/local_data_provider.dart';
import 'package:pandora_front/app/routes/app_pages.dart';
import 'package:pandora_front/app/translations/app_translations.dart';
import 'package:pandora_front/app/ui/theme/theme_provider.dart';
import 'package:pandora_front/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: ".env");
  await LocalDataProvider.init();

  setCookie('SameSite', 'Secure', 7);

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pandora',
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.onlyBuilder,
      initialRoute: Routes.initial,
      theme: Provider.of<ThemeProvider>(context).themeData,
      defaultTransition: Transition.rightToLeft,
      getPages: AppPages.routes,
      locale: const Locale('pt', 'BR'),
      translationsKeys: AppTranslation.translations,
    );
  }
}
