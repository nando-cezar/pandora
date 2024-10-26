from flask_restful import Resource, reqparse, marshal_with

from app.blueprint.restapi.exception.exception import abort_if_unauthorized, abort_if_not_exists
from app.core.probability import Probability
from app.ext.database import db
from app.model.extreme_event import ExtremeEvent
from app.model.location import Location


class ExtremeEventResource(Resource):

    def __init__(self, secret_key: str, probability: Probability):
        self.secret_key = secret_key
        self.probability = probability
        self.parser = reqparse.RequestParser(bundle_errors=True)
        self.parser.add_argument('Latitude', type=float, required=True,
                                 help='Latitude not given', location='args')
        self.parser.add_argument('Longitude', type=float, required=True,
                                 help='Longitude not given', location='args')
        self.parser.add_argument('Timezone', type=str, required=True,
                                 help='Timezone not given', location='args')
        self.parser.add_argument('PastDays', type=int, required=True,
                                 help='Past days not given', location='args')
        self.parser.add_argument('ForecastDays', type=int, required=True,
                                 help='Forecast days not given', location='args')
        self.parser.add_argument('Token', type=str, required=True,
                                 help='Token is mandatory', location='args')
        args = self.parser.parse_args()

        self.latitude = args['Latitude']
        self.longitude = args['Longitude']
        self.timezone = args['Timezone']
        self.past_days = args['PastDays']
        self.forecast_days = args['ForecastDays']
        self.continent = "South America"
        self.country = "Brazil"
        self.token = args['Token']

        super(ExtremeEventResource, self).__init__()

    @marshal_with(fields=ExtremeEvent.resource_fields)
    def get(self):
        abort_if_unauthorized(self.token != self.secret_key)

        data = self._get_extreme_event_data()

        abort_if_not_exists(data)

        return data

    def _get_extreme_event_data(self):
        response = []

        probability_result = (
            self.probability
            .calculate(
                latitude=self.latitude,
                longitude=self.longitude,
                timezone=self.timezone,
                past_days=self.past_days,
                forecast_days=self.forecast_days,
                continent=self.continent,
                country=self.country
            )
        )

        abort_if_not_exists(probability_result)

        extreme_event_ref = db.source.collection("Extreme Event") \
            .document(self.continent) \
            .collection(self.country) \
            .stream()

        for count, doc in enumerate(extreme_event_ref):
            location_data_ref = doc.reference.collection("Location Data").stream()
            location_data = [
                Location({
                    "id": sub_doc.get('id'),
                    "address": sub_doc.get('address'),
                    "state": sub_doc.get('state'),
                    "region": sub_doc.get('region'),
                    "latitude": sub_doc.get('position').latitude,
                    "longitude": sub_doc.get('position').longitude,
                    "start_date": sub_doc.get('start_date'),
                    "end_date": sub_doc.get('end_date'),
                    "total_affected": sub_doc.get('total_affected'),
                    "total_death": sub_doc.get('total_death'),
                }).__dict__ for sub_doc in location_data_ref
            ]

            extreme_event_data = {
                "code": doc.get('code'),
                "code_formatted": doc.get('code_formatted'),
                "data_source": doc.get('data_source'),
                "description": doc.get('description'),
                "description_formatted": doc.get('description_formatted'),
                "medium_duration": doc.get('medium_duration'),
                "site_greatest_recurrences": doc.get('site_greatest_recurrence'),
                "total_location_records": doc.get('total_location_records'),
                "total_recurrence": doc.get('total_recurrence'),
                "region_greatest_recurrences": doc.get('region_greatest_recurrence'),
                "probability_occurrence": probability_result[count],
                "locations": location_data
            }

            response.append(extreme_event_data)

        abort_if_not_exists(response)

        return ExtremeEvent(response).__dict__
