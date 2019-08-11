FROM richarvey/nginx-php-fpm:1.7.4

RUN sed -i \
    -e "s/git clone /&--recurse-submodules /g" /start.sh

ADD conf/ /etc/nginx/sites-enabled/

CMD ["/start.sh"]