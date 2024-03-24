from flask import Blueprint
from flask_restful import Api

from .extreme_event_data_general_resources import ExtremeEventDataGeneralResource

bp = Blueprint("restapi", __name__, url_prefix="/api/v1")
api = Api(bp)


def init_app(app):
    resource_params = {
        "secret_key": app.config.SECRET_KEY,
    }
    api.add_resource(ExtremeEventDataGeneralResource, "/extreme-events/data-general", resource_class_kwargs=resource_params)
    app.register_blueprint(bp)