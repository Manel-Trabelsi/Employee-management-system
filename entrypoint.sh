#!/bin/bash
# Wait for DB to be up (optional but recommended)


echo "✅ MySQL is up - running migrations"
python init_db.py
python -m app.admin.create_admin

# Start Flask app
exec flask run --host=0.0.0.0
