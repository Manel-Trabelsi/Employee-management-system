#!/bin/bash
# Wait for DB to be up (optional but recommended)
echo "⏳ Waiting for MySQL...."
until nc -z -v -w30 db 3306
do
  echo "❌ MySQL is unavailable - sleeping"
  sleep 5
done

echo "✅ MySQL is up - running migrations"
python init_db.py
python -m app.admin.create_admin

# Start Flask app
exec flask run --host=0.0.0.0
