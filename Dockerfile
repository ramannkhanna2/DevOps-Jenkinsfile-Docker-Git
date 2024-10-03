FROM ubuntu:18.04
MAINTAINER Raman Khanna raman@email

ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir /data
RUN apt-get update -y
RUN apt-get -y install apache2 php

# Set timezone to UTC
RUN ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

RUN echo " Raman Deals in DevOps and Cloud" > /var/www/html/index.html

EXPOSE 80

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
