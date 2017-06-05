FROM php:5.6.30-fpm
MAINTAINER Carlos López <cladev@gmail.com>
RUN apt-get update \
  && apt-get install -y \
  git \
  && docker-php-ext-install -j$(nproc) pdo pdo_mysql \
  && rm -rf /var/lib/apt/lists/*
COPY composer.phar /usr/local/bin/composer
RUN chmod 0755 /usr/local/bin/composer \
  && mkdir /var/www/.composer \
  && chown www-data:www-data /var/www/.composer
