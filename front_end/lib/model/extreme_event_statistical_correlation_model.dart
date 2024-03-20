class ExtremeEventStatisticalCorrelation {
  final double cold_wave;
  final double flash_flood;
  final double flood_general;
  final double heat_wave;
  final double riverine_flood;
  final double storm_general;
  final double tropical_cyclone;

  ExtremeEventStatisticalCorrelation({
    required this.cold_wave,
    required this.flash_flood,
    required this.flood_general,
    required this.heat_wave,
    required this.riverine_flood,
    required this.storm_general,
    required this.tropical_cyclone,
  });

  factory ExtremeEventStatisticalCorrelation.fromJson(Map<String, dynamic> json){
    return ExtremeEventStatisticalCorrelation(
      cold_wave: json['content']['0'].toDouble(),
      flash_flood: json['content']['1'].toDouble(),
      flood_general: json['content']['2'].toDouble(),
      heat_wave: json['content']['3'].toDouble(),
      riverine_flood: json['content']['4'].toDouble(),
      storm_general: json['content']['5'].toDouble(),
      tropical_cyclone: json['content']['6'].toDouble(),
    );
  }
}