FROM php:7.4.28-apache
COPY www.ycdisp.com.conf /etc/apache2/sites-enabled/www.ycdisp.com.conf
RUN docker-php-ext-install mysqli
RUN a2enmod rewrite