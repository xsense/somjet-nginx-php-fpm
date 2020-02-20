FROM richarvey/nginx-php-fpm:1.9.0

RUN sed -i \
    -e "s/git clone /&--recurse-submodules /g" /start.sh
    
RUN sed -i \
        -e "s/pm.max_children = 4/pm.max_children = 20/g" \
        -e "s/pm.max_requests = 200/pm.max_requests = 1000/g" \
        /usr/local/etc/php-fpm.d/www.conf

ADD conf/ /etc/nginx/sites-enabled/

CMD ["/start.sh"]