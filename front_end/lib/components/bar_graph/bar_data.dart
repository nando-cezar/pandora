import 'individual_bar.dart';

class BarData {
  final double cold_wave;
  final double flash_flood;
  final double flood_general;
  final double heat_wave;
  final double riverine_flood;
  final double storm_general;
  final double tropical_cyclone;

  BarData({
    required this.cold_wave,
    required this.flash_flood,
    required this.flood_general,
    required this.heat_wave,
    required this.riverine_flood,
    required this.storm_general,
    required this.tropical_cyclone,
  });

  List<IndividualBar> barData = [];

  void initializeBarData(){




    barData = [
      IndividualBar(x: 0, y: cold_wave),
      IndividualBar(x: 1, y: flash_flood),
      IndividualBar(x: 2, y: flood_general),
      IndividualBar(x: 3, y: heat_wave),
      IndividualBar(x: 4, y: riverine_flood),
      IndividualBar(x: 5, y: storm_general),
      IndividualBar(x: 6, y: tropical_cyclone),
    ];
  }

}