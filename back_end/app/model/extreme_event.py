from flask_restful import fields

from app.model.central_measurement import resource_fields_central_measurement_data
from app.model.location import resource_fields_locations

resource_fields_extreme_event = {
    'uri': fields.Url('restapi.extremeeventresource', absolute=True),
    'https_uri': fields.Url('restapi.extremeeventresource', absolute=True, scheme='https'),
    'resource': fields.List(fields.Nested({
        'code': fields.Integer,
        'code_formatted': fields.String,
        'data_source': fields.List(fields.String),
        'description': fields.String,
        'description_formatted': fields.String,
        'medium_duration': fields.Float,
        'site_greatest_recurrence': fields.List(fields.Nested({
            'address': fields.String,
            'region': fields.String,
            'state': fields.String,
            'subtotal_records': fields.Integer
        })),
        'total_location_records': fields.Integer,
        'total_recurrence': fields.Integer,
        'region_greatest_recurrence': fields.List(fields.Nested({
            'region': fields.String,
            'recurrence': fields.Integer,
        })),
        'probability_occurrence': fields.Float,
        'central_measurement_data': resource_fields_central_measurement_data,
        'locations': resource_fields_locations
    }))
}
class ExtremeEvent(object):
    def __init__(self, resource):
        self.resource = resource