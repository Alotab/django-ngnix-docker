# Dockerizing Django Application — and Nginx

Running your Django application and Nginx proxy inside of Docker containers ensures that these components behave the same way regardless of the environment they are deployed into.


## Usage

 1. Using Python 3.8, run `python -m venv env` to create a virtual environment
 2. Run `pip install -r requirements.txt` to install dependencies
 3. Run `cd app/` to change to `app/`
 3. Run `python manage.py runserver` to start development server
