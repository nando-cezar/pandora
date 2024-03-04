import 'individual_bar.dart';

class BarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;
  final double sunAmount0;
  final double monAmount1;
  final double tueAmount2;
  final double wedAmount3;
  final double thurAmount4;
  final double friAmount5;
  final double satAmount6;

  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.friAmount,
    required this.satAmount,
    required this.sunAmount0,
    required this.monAmount1,
    required this.tueAmount2,
    required this.wedAmount3,
    required this.thurAmount4,
    required this.friAmount5,
    required this.satAmount6,
  });

  List<IndividualBar> barData = [];

  void initializeBarData(){
    barData = [
      IndividualBar(x: 0, y: sunAmount),
      IndividualBar(x: 1, y: monAmount),
      IndividualBar(x: 2, y: tueAmount),
      IndividualBar(x: 3, y: wedAmount),
      IndividualBar(x: 4, y: thurAmount),
      IndividualBar(x: 5, y: friAmount),
      IndividualBar(x: 6, y: satAmount),
      IndividualBar(x: 0, y: sunAmount0),
      IndividualBar(x: 1, y: monAmount1),
      IndividualBar(x: 2, y: tueAmount2),
      IndividualBar(x: 3, y: wedAmount3),
      IndividualBar(x: 4, y: thurAmount4),
      IndividualBar(x: 5, y: friAmount5),
      IndividualBar(x: 6, y: satAmount6),
    ];
  }

}