FROM php:7.4.28-apache
COPY test.ycdisp.com.conf /etc/apache2/sites-enabled/test.ycdisp.com.conf
RUN docker-php-ext-install mysqli
RUN a2enmod rewrite