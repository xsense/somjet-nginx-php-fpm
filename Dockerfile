FROM richarvey/nginx-php-fpm:1.8.2

RUN sed -i \
    -e "s/git clone /&--recurse-submodules /g" /start.sh

ADD conf/ /etc/nginx/sites-enabled/

CMD ["/start.sh"]