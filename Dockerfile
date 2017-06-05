FROM php:5.6.30-fpm
MAINTAINER Carlos López <cladev@gmail.com>
RUN apt-get update \
  && apt-get install -y \
  git \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libmcrypt-dev \
  libpng12-dev \
  libzip-dev \
  && docker-php-ext-install -j$(nproc) iconv mcrypt pdo pdo_mysql zip \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install -j$(nproc) gd \
  && rm -rf /var/lib/apt/lists/*
COPY composer.phar /usr/local/bin/composer
RUN chmod 0755 /usr/local/bin/composer \
  && mkdir /var/www/.composer \
  && chown www-data:www-data /var/www/.composer

