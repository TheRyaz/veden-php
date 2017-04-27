FROM php:7.0-apache
RUN docker-php-ext-install mysqli

RUN a2enmod rewrite
RUN a2enmod headers

COPY config/apache2.conf /etc/apache2/apache2.conf
COPY config/php.ini /usr/local/etc/php/conf.d/custom-php.ini

RUN apt-get update && apt-get install -y unzip && apt-get clean
RUN mkdir /.composer && chown -R 1000:1000 /.composer

VOLUME "/var/www/src"
VOLUME "/var/www/templates"
VOLUME "/var/www/tests"
VOLUME "/var/www/vendor"
