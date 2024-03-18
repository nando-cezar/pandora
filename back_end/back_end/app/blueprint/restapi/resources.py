from flask import jsonify, request, make_response
from flask_restful import Resource

from app.ext.database import db


class ExtremeEventResource(Resource):
    def get(self):
        # token = request.args.get('token')

        # if token and self._verify_token(token):
        _dict = []

        extreme_event_ref = db.source.collection("Extreme Event").document("South America")

        collections = extreme_event_ref.collections()
        for collection in collections:
            for doc in collection.stream():
                docs = extreme_event_ref.collection("Brazil").document(doc.id).collection("Location Data").stream()
                for doc in docs:
                    _dict.append([doc.to_dict().get('position').latitude, doc.to_dict().get('position').longitude])

        return jsonify(
            {"extreme_events": [_dict]}
        )

        # return make_response('Success', 200)
        # return make_response('Unauthorized', 401)

    #def _verify_token(token):
    #    return token == app.config.SECRET_KEY
