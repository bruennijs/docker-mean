#
# Installing tools to run & build web applications written in Javascript / Typescript
#
FROM ubuntu:14.10
MAINTAINER Oliver Brüntje "oliver.bruentje@gmx.de"

# RUN apt-get install -y mongodb
# USE mongodb 3.0.x
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
RUN apt-get update

RUN apt-get install -y mongodb-org
RUN apt-get install -y mongodb-org-server
RUN apt-get install -y mongodb-org-shell
RUN apt-get install -y nodejs
RUN apt-get install -y wget
RUN apt-get install -y git
RUN apt-get install -y npm

RUN apt-get install -y nginx
RUN apt-get autoclean

# ============= mongoDB ===============
COPY ./mongod.conf /etc/
RUN mkdir -p /data/db
RUN chown -R mongodb:mongodb /data/db
VOLUME /data/db
EXPOSE 27017
EXPOSE 28017
# ============= mongoDB ===============

# ============= nginx ===============
COPY ./nginx.conf /etc/nginx/
VOLUME /www/data
EXPOSE 8080
# ============= nginx ===============




