import firebase_admin
from firebase_admin import credentials, firestore


class FirestoreDB:

    def __init__(self, app=None):
        self.source = None
        self.app = app
        if app:
            self.init_app(app)

    def init_app(self, app):
        cred = credentials.Certificate(app.config.FIRESTORE_KEY)
        _app = firebase_admin.initialize_app(cred)
        self.source = firestore.client(app=_app)
