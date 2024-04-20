import 'package:get/get.dart';

class PositionController extends GetxController {
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  void updateLatLng(double latitude, double longitude){
    _latitude.value = latitude;
    _longitude.value = longitude;
  }

  double getLatitude() =>  _latitude.value;

  double getLongitude() =>  _longitude.value;
}
