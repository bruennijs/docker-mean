#
# Installing tools to run & build web applications written in Javascript / Typescript
#
FROM ubuntu:14.10
MAINTAINER Oliver Brüntje "oliver.bruentje@gmx.de"

RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get install -y wget
RUN apt-get install -y git
RUN apt-get install -y npm
RUN apt-get install -y mongodb
RUN apt-get install -y nginx
RUN apt-get autoclean

# ============= mongoDB ===============
COPY ./mongodb.conf /etc/
VOLUME /var/lib/mongodb
EXPOSE 27017
EXPOSE 28017
# ============= mongoDB ===============

# ============= nginx ===============
COPY ./nginx.conf /etc/nginx/
VOLUME /www/data
EXPOSE 8080
# ============= nginx ===============




