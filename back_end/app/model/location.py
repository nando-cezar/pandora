class Location:
    def __init__(self, data):
        self.id = data.get('id')
        self.address = data.get('address')
        self.state = data.get('state')
        self.region = data.get('region')
        self.latitude = data.get('latitude')
        self.longitude = data.get('longitude')

    def to_dict(self):
        return {
            "id": self.id,
            "address": self.address,
            "state": self.state,
            "region": self.region,
            "latitude": self.latitude,
            "longitude": self.longitude
        }