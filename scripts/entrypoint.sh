#!/bin/sh

set -e  # exit if there's erros running in the shell script with exit code 0 which means something went wrong

# django management command that collects all static files for the project
# put these files in the static root
python manage.py collectstatic --noinput   

# command that runs the django app using uwsgi
# this will run on a tcp socket on port 8000
# run this on the master service/thread on the app. 
# Means run the uwsgi in full ground instead of a background task
# enable-threads enables multi-threading in uwsgi
uwsgi --socket :8000 --master --enable-threads --module app.wsgi

