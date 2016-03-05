#!/bin/bash

apt-get update && apt-get install -y libpng12-dev libjpeg-dev 

docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr

docker-php-ext-install gd mysqli mysql opcache mbstring

cat <<EOF > /usr/local/etc/php/conf.d/opcache-recommended.ini
opcache.memory_consumption=128
opcache.interned_strings_buffer=8
opcache.max_accelerated_files=4000
opcache.revalidate_freq=60
opcache.fast_shutdown=1
opcache.enable_cli=1
EOF
