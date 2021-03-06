# src/__init__.py

import os

from flask import Flask
from flask_admin import Admin
from flask_sqlalchemy import SQLAlchemy

# initiate the db
db = SQLAlchemy()
admin = Admin(template_mode="bootstrap4")


def create_app(script_info=None):
    app = Flask(__name__)

    app_settings = os.getenv("APP_SETTINGS")
    app.config.from_object(app_settings)

    db.init_app(app)

    if os.getenv("FLASK_ENV") == "development":
        admin.init_app(app)

    from src.api import api

    api.init_app(app)

    @app.shell_context_processor
    def ctx():
        return {"db": db, "app": app}

    return app
