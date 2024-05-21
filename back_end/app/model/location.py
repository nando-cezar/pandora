from flask_restful import fields


class MyDateFormat(fields.Raw):
    def format(self, value):
        return value.strftime('%d-%m-%Y')


class Location(object):
    def __init__(self, data):
        self.id = data['id']
        self.address = data['address']
        self.state = data['state']
        self.region = data['region']
        self.latitude = data['latitude']
        self.longitude = data['longitude']
        self.start_date = data['start_date']
        self.end_date = data['end_date']
        self.total_affected = data['total_affected']
        self.total_death = data['total_death']

    resource_fields = fields.List(
        fields.Nested({
            'id': fields.String,
            'address': fields.String,
            'state': fields.String,
            'region': fields.String,
            'latitude': fields.Float,
            'longitude': fields.Float,
            'start_date': MyDateFormat,
            'end_date': MyDateFormat,
            'total_affected': fields.Integer,
            'total_death': fields.Integer
        }))
