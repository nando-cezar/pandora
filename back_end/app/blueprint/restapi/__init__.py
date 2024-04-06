from flask import Blueprint
from flask_restful import Api

from app.blueprint.restapi.resource.extreme_event_resource import ExtremeEventResource

bp = Blueprint("restapi", __name__, url_prefix="/api/v1")
api = Api(bp)


def init_app(app):
    resource_params = {
        "secret_key": app.config.SECRET_KEY,
    }
    api.add_resource(ExtremeEventResource, "/extreme-events/data-general", resource_class_kwargs=resource_params)
    app.register_blueprint(bp)