FROM php:8.0.3-fpm-alpine3.12

# ADD ./php/www.conf /usr/local/etc/php-fpm.d/

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

RUN mkdir -p /var/www/html

RUN chown laravel:laravel /var/www/html

WORKDIR /var/www/html

# RUN usermod -u 1000 laravel

RUN docker-php-ext-install pdo pdo_mysql

RUN apk add libzip-dev

RUN docker-php-ext-install zip
# RUN apk add shadow && usermod -u 1000 www-data && groupmod -g 1000 www-data
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer