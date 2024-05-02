import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/ui/theme/theme_provider.dart';
import 'package:provider/provider.dart';


class MapController extends GetxController {
  Future<String> loadMapStyle() async {
    var themeProvider = Provider.of<ThemeProvider>(Get.context!, listen: false);
    String value = await DefaultAssetBundle.of(Get.context!)
        .loadString(themeProvider.getMapStyle());
    return value;
  }
}
