FROM php:7.4.28-apache
COPY test.ycdisp.com.conf /etc/apache2/sites-enabled/test.ycdisp.com.conf
RUN apt-get update
RUN apt-get install -q -y ssmtp mailutils

RUN docker-php-ext-install mysqli
RUN a2enmod rewrite

RUN echo "sendmail_path=sendmail -i -t" >> /usr/local/etc/php/conf.d/php-sendmail.ini

COPY ssmtp.conf /etc/ssmtp/ssmtp.conf

ARG PASSWORD
RUN echo "AuthPass=$PASSWORD" >> /etc/ssmtp/ssmtp.conf

