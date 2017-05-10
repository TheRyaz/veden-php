FROM php:7.0-apache

RUN apt-get update && apt-get install -y unzip libssl-dev libcurl4-openssl-dev pkg-config && apt-get clean
RUN pecl install mongodb

RUN a2enmod rewrite
RUN a2enmod headers

COPY config/apache2.conf /etc/apache2/apache2.conf
COPY config/php.ini /usr/local/etc/php/conf.d/custom-php.ini
COPY config/mongo.ini /usr/local/etc/php/conf.d/mongo.ini

VOLUME "/var/www/src"
VOLUME "/var/www/templates"
VOLUME "/var/www/tests"
VOLUME "/var/www/vendor"
