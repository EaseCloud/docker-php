FROM php:apache
MAINTAINER huangwc@easecloud.cn

ENV TZ=Asia/Shanghai

COPY ./build.sh /var/www/

RUN bash /var/www/build.sh && rm -f /var/www/build.sh

EXPOSE 80

CMD ["apache2-foreground"]
