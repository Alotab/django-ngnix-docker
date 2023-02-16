FROM nginxinc/nginx-unprivileged:1-alpine        

# copy the default.conf/uwsgi_params files into location in the docker container 
# that nginx expects to finds a configuration
COPY ./default.conf /etc/nginx/conf.d/default.conf 
COPY ./uwsgi_params /etc/nginx/uwsgi_params 

# temporary switches to the root user which allows to create new files within the docker image
USER root

# creates new static folder in docker image and give permssion 755 (owner/full access)
RUN mkdir -p /vol/static
RUN chmod 755 /vol/static

# switch back to the unprivileged user nginx so we dont run the image in root
USER nginx




# Dockerfile specifically for nginx
# stop the docker-compose if its still running 
# cd proxy and run docker build . (to make sure the the docker file build without any issues)
# now we customisze the django application-settings