FROM php:5-fpm
MAINTAINER huangwc@easecloud.cn

ENV TZ=Asia/Shanghai

COPY ./build.sh /var/www/

RUN bash /var/www/build.sh && rm -f /var/www/build.sh

CMD ["php-fpm"]
