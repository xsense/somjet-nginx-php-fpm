FROM richarvey/nginx-php-fpm:1.7.4

RUN sed -i \
    -e "s/#keepalive_timeout  0;/keepalive_timeout 0;/g" /etc/nginx/nginx.conf \
    -e "s/keepalive_timeout 2;/#keepalive_timeout 2;/g" /etc/nginx/nginx.conf \
    -e "s/git clone /&--recurse-submodules /g" /start.sh

ADD conf/ /etc/nginx/sites-enabled/

CMD ["/start.sh"]