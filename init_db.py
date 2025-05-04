import os
from app import create_app, db
from app.models import *

config_name = os.getenv('FLASK_CONFIG') or 'default'
app = create_app(config_name)

with app.app_context():
    db.create_all()
    print("✅ All tables created.")
