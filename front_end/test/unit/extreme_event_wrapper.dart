import 'package:flutter_test/flutter_test.dart';
import 'package:pandora_front/app/data/model/extreme_event_wrapper.dart';

void main() {
  group('ExtremeEventWrapper', () {
    test('should create an instance with an empty list of events', () {
      final wrapper = ExtremeEventWrapper(events: []);

      expect(wrapper.events, isEmpty);
    });

    test('should create an instance from JSON', () {
      final json = {
        'resource': [
          {
            'code': 1,
            'code_formatted': '001',
            'description': 'Description',
            'description_formatted': 'Formatted Description',
            'data_source': ['source1', 'source2'],
            'locations': [],
            'site_greatest_recurrences': [],
            'region_greatest_recurrences': [],
            'medium_duration': 12.5,
            'probability_occurrence': [0.5, 0.75],
            'total_location_records': 10,
            'total_recurrence': 5,
          },
          {
            'code': 2,
            'code_formatted': '002',
            'description': 'Another Description',
            'description_formatted': 'Another Formatted Description',
            'data_source': ['source3', 'source4'],
            'locations': [],
            'site_greatest_recurrences': [],
            'region_greatest_recurrences': [],
            'medium_duration': 10.0,
            'probability_occurrence': [0.3, 0.6],
            'total_location_records': 20,
            'total_recurrence': 10,
          },
        ],
      };

      final wrapper = ExtremeEventWrapper.fromJson(json);

      expect(wrapper.events, isNotEmpty);
      expect(wrapper.events.length, 2);

      final firstEvent = wrapper.events[0];
      expect(firstEvent.code, 1);
      expect(firstEvent.codeFormatted, '001');
      expect(firstEvent.description, 'Description');
      expect(firstEvent.descriptionFormatted, 'Formatted Description');
      expect(firstEvent.dataSource, ['source1', 'source2']);
      expect(firstEvent.locations, isEmpty);
      expect(firstEvent.siteGreatestRecurrences, isEmpty);
      expect(firstEvent.regionGreatestRecurrences, isEmpty);
      expect(firstEvent.mediumDuration, 12.5);
      expect(firstEvent.probabilityOccurrence, [0.5, 0.75]);
      expect(firstEvent.totalLocationRecords, 10);
      expect(firstEvent.totalRecurrence, 5);

      final secondEvent = wrapper.events[1];
      expect(secondEvent.code, 2);
      expect(secondEvent.codeFormatted, '002');
      expect(secondEvent.description, 'Another Description');
      expect(secondEvent.descriptionFormatted, 'Another Formatted Description');
      expect(secondEvent.dataSource, ['source3', 'source4']);
      expect(secondEvent.locations, isEmpty);
      expect(secondEvent.siteGreatestRecurrences, isEmpty);
      expect(secondEvent.regionGreatestRecurrences, isEmpty);
      expect(secondEvent.mediumDuration, 10.0);
      expect(secondEvent.probabilityOccurrence, [0.3, 0.6]);
      expect(secondEvent.totalLocationRecords, 20);
      expect(secondEvent.totalRecurrence, 10);
    });

    test('should handle empty resource list in JSON', () {
      final json = {'resource': []};

      final wrapper = ExtremeEventWrapper.fromJson(json);

      expect(wrapper.events, isEmpty);
    });

    test('should handle missing resource key in JSON', () {
      final Map<String, dynamic> json = {};

      final wrapper = ExtremeEventWrapper.fromJson(json);

      expect(wrapper.events, isEmpty);
    });
  });
}