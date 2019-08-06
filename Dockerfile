FROM richarvey/nginx-php-fpm:latest

RUN sed -i \
    -e "s/git clone /&--recurse-submodules /g" /start.sh

ADD conf/ /etc/nginx/sites-enabled/

CMD ["/start.sh"]