#!/bin/bash
echo "Running migrations..."
python manage.py migrate
echo "Running collectstatic...."
python manage.py collectstatic --no-input
echo "Starting gunicorn"
gunicorn --bind 0.0.0.0:$PORT dogcat.wsgi