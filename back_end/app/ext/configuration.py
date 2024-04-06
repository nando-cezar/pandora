from importlib import import_module

from dynaconf import FlaskDynaconf
from flask_cors import CORS


def load_extensions(app):
    for extension in app.config.EXTENSIONS:
        mod = import_module(extension)
        mod.init_app(app)


def init_app(app):
    FlaskDynaconf(app)
    CORS(app, resources={r"/api/*": {"origins": "*"}})

