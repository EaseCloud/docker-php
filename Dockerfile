FROM php:5-fpm
MAINTAINER huangwc@easecloud.cn

ADD ./build.sh ./

RUN chmod +x ./build.sh && ./build.sh

CMD ["php-fpm"]
