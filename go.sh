#!/bin/bash
docker build -t php-fpm-laravel -t php-fpm-laravel:5.6.30 . \
  && docker images -qf dangling=true | xargs -r docker rmi
