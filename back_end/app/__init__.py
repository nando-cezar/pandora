from flask import Flask
from flask_cors import CORS

from app.ext import configuration


def create_app():
    app = Flask("__name__")
    configuration.init_app(app)
    configuration.load_extensions(app)
    CORS(app, resources={r"/api/*": {"origins": "*"}})
    return app
