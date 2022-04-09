# Filename: Dockerfile
FROM php:7.4-fpm

COPY php.ini /usr/local/php/

RUN docker-php-ext-install mysqli

RUN apt-get update -y && apt-get install -y sendmail libpng-dev

RUN docker-php-ext-install gd
