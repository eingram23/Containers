# Filename: Dockerfile
FROM php:7.4.32-fpm

COPY php.ini /usr/local/etc/php/

RUN docker-php-ext-install mysqli

RUN apt-get update -y && apt-get install -y libonig-devs endmail libpng-dev libmagickwand-dev --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN printf "\n" | pecl install imagick
RUN docker-php-ext-enable imagick mbstring exif

# RUN docker-php-ext-install gd
