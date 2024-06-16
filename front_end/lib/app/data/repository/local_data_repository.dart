import 'package:pandora_front/app/data/provider/local_data_provider.dart';

class LocalDataRepository {
  final LocalDataProvider localDataProvider;

  LocalDataRepository({required this.localDataProvider});

  saveString(String key, String value) => localDataProvider.saveString(key, value);

  String getString(String key) => localDataProvider.getString(key);

  saveInt(String key, int value) => localDataProvider.saveInt(key, value);

  int  getInt(String key) => localDataProvider.getInt(key);

  saveDouble(String key, double value) => localDataProvider.saveDouble(key, value);

  double getDouble(String key) => localDataProvider.getDouble(key);

}