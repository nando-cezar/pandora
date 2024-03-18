from app.db.firebase import FirestoreDB

db = FirestoreDB()


def init_app(app):
    db.init_app(app)
