#!/bin/bash

apt-get update

# gd support
apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev
docker-php-ext-configure gd \
    --with-freetype-dir=/usr/include/freetype2 \
    --with-png-dir=/usr/include \
    --with-jpeg-dir=/usr/include 
docker-php-ext-install gd

# pdo mysql support
docker-php-ext-install pdo pdo_mysql

# opcache support
docker-php-ext-install opcache
cat <<EOF > /usr/local/etc/php/conf.d/opcache-recommended.ini
opcache.memory_consumption=128
opcache.interned_strings_buffer=8
opcache.max_accelerated_files=4000
opcache.revalidate_freq=60
opcache.fast_shutdown=1
opcache.enable_cli=1
EOF

# curl support
apt-get install -y \
    libcurl4-gnutls-dev
docker-php-ext-install curl

# mcrypt support
apt-get install -y \
    libmcrypt-dev
docker-php-ext-install mcrypt

# zip support
apt-get install -y \
    zlib1g-dev
docker-php-ext-install zip

# LDAP support
apt-get install -y \
    libldb-dev \
    libldap2-dev
ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/libldap.so \
    && ln -s /usr/lib/x86_64-linux-gnu/liblber.so /usr/lib/liblber.so
docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/
docker-php-ext-install ldap

# pgsql support
apt-get install -y \
    libpq-dev
docker-php-ext-install pgsql

# other php supports
docker-php-ext-install mysqli mbstring bcmath

# install wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/bin/wp-cli
