from flask_restful import fields

resource_fields_locations = fields.List(
    fields.Nested({
        'id': fields.String,
        'address': fields.String,
        'state': fields.String,
        'region': fields.String,
        'latitude': fields.Float,
        'longitude': fields.Float
    }))

class Location(object):
    def __init__(self, data):
        self.id = data['id']
        self.address = data['address']
        self.state = data['state']
        self.region = data['region']
        self.latitude = data['latitude']
        self.longitude = data['longitude']