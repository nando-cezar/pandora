import 'package:flutter_test/flutter_test.dart';
import 'package:pandora_front/app/data/model/location_model.dart';

void main() {
  group('LocationModel', () {
    test('should create an instance with all properties', () {
      final model = LocationModel(
        markerID: 'marker-id',
        uid: 'uid',
        address: '123 Street',
        state: 'NY',
        region: 'Northeast',
        latitude: 40.7128,
        longitude: -74.0060,
        type: 'Flood, General',
        startDate: '2022-01-01',
        endDate: '2022-01-10',
        totalAffected: 1000,
        totalDeath: 50,
      );

      expect(model.markerID, 'marker-id');
      expect(model.uid, 'uid');
      expect(model.address, '123 Street');
      expect(model.state, 'NY');
      expect(model.region, 'Northeast');
      expect(model.latitude, 40.7128);
      expect(model.longitude, -74.0060);
      expect(model.type, 'Flood, General');
      expect(model.startDate, '2022-01-01');
      expect(model.endDate, '2022-01-10');
      expect(model.totalAffected, 1000);
      expect(model.totalDeath, 50);
    });

    test('should create an instance from JSON', () {
      final json = {
        'id': 'uid',
        'address': '123 Street',
        'state': 'NY',
        'region': 'Northeast',
        'latitude': 40.7128,
        'longitude': -74.0060,
        'start_date': '2022-01-01',
        'end_date': '2022-01-10',
        'total_affected': 1000,
        'total_death': 50,
      };

      final model = LocationModel.fromJson(json, 'Flood, General');

      expect(model.markerID, isNotNull);
      expect(model.uid, 'uid');
      expect(model.address, '123 Street');
      expect(model.state, 'NY');
      expect(model.region, 'Northeast');
      expect(model.latitude, 40.7128);
      expect(model.longitude, -74.0060);
      expect(model.type, 'Flood, General');
      expect(model.startDate, '2022-01-01');
      expect(model.endDate, '2022-01-10');
      expect(model.totalAffected, 1000);
      expect(model.totalDeath, 50);
    });

    test('should convert an instance to JSON', () {
      final model = LocationModel(
        markerID: 'marker-id',
        uid: 'uid',
        address: '123 Street',
        state: 'NY',
        region: 'Northeast',
        latitude: 40.7128,
        longitude: -74.0060,
        type: 'Flood, General',
        startDate: '2022-01-01',
        endDate: '2022-01-10',
        totalAffected: 1000,
        totalDeath: 50,
      );

      final json = model.toJson();

      expect(json['markerID'], 'marker-id');
      expect(json['uid'], 'uid');
      expect(json['address'], '123 Street');
      expect(json['state'], 'NY');
      expect(json['region'], 'Northeast');
      expect(json['latitude'], 40.7128);
      expect(json['longitude'], -74.0060);
      expect(json['startDate'], '2022-01-01');
      expect(json['endDate'], '2022-01-10');
      expect(json['totalAffected'], 1000);
      expect(json['totalDeath'], 50);
      expect(json['type'], 'Flood, General');
      expect(json['icon'], 'assets/images/marker_orange.png');
      expect(json['image'], 'assets/images/extreme_events/flood_general.jpg');
    });

    test('should handle null values correctly', () {
      final model = LocationModel(
        markerID: null,
        uid: null,
        address: null,
        state: null,
        region: null,
        latitude: null,
        longitude: null,
        type: null,
        startDate: null,
        endDate: null,
        totalAffected: null,
        totalDeath: null,
      );

      final json = model.toJson();

      expect(json.containsKey('markerID'), false);
      expect(json.containsKey('uid'), false);
      expect(json.containsKey('address'), false);
      expect(json.containsKey('state'), false);
      expect(json.containsKey('region'), false);
      expect(json.containsKey('latitude'), false);
      expect(json.containsKey('longitude'), false);
      expect(json.containsKey('startDate'), false);
      expect(json.containsKey('endDate'), false);
      expect(json.containsKey('totalAffected'), false);
      expect(json.containsKey('totalDeath'), false);
      expect(json.containsKey('type'), false);
      expect(json.containsKey('icon'), false);
      expect(json.containsKey('image'), false);
    });
  });
}