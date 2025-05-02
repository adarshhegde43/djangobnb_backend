#!/bin/bash

set -euo pipefail  # Strict error handling

# Self-healing permissions (safety net)
[ "$(stat -c %a "$0")" -gt 755 ] && chmod 755 "$0"

if [ "$DATABASE" = "postgres" ] 
then
    echo "Check if database is running..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
        sleep 0.1
    done

    echo "The database is up and running :-D"
fi

python manage.py makemigrations
python manage.py migrate

exec "$@"


