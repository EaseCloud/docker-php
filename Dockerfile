FROM php:5-fpm
MAINTAINER huangwc@easecloud.cn

ADD build.sh /var/www/

RUN chmod +x /var/www/build.sh && /var/www/build.sh

CMD ["php-fpm"]
