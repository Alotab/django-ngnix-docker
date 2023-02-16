FROM python:3.8-alpine

# add scripts to the path of the running container
ENV PATH="/scripts:${PATH}"   


COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache --virtual .tmp gcc libc-dev linux-headers
RUN pip install -r /requirements.txt
RUN apk del .tmp

# create an app folder within the root of the docker file. 
# Copy the main app folder(django app) into the docker file
RUN mkdir /app
COPY  ./app /app
WORKDIR /app
COPY ./scripts /scripts

# all scripts gets the executble permision
RUN chmod +x /scripts/*

# set up folders for static files(html, css, js) and media files (pics/video)
RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static

# run the application with less privilege user. 
# not advisable to run with admin/root user in case of hacker taking control over the app
RUN adduser -D user
RUN chown -R user:user /vol
RUN chmod -R 755 /vol/web
USER user

# entry point to the application / entry point to start the application
CMD ["entrypoint.sh"]
