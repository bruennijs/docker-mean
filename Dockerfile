#
# Installing tools to run & build web applications written in Javascript / Typescript
#
FROM ubuntu:14.04
MAINTAINER Oliver Brüntje "oliver.bruentje@gmx.de"

RUN apt-get update
RUN apt-get install -y curl

RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

RUN apt-get install -y nodejs
RUN apt-get install -y wget
RUN apt-get install -y git
#RUN apt-get install -y npm

RUN apt-get install -y nginx
# RUN apt-get autoclean

# ============= nginx ===============
COPY ./nginx.conf /etc/nginx/
VOLUME /www/data
EXPOSE 8080
# ============= nginx ===============




