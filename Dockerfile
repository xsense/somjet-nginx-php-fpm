FROM richarvey/nginx-php-fpm:latest

RUN sed -i \
    -e "s/#gzip.*/gzip on;/g" /etc/nginx/nginx.conf \
    -e "s/git clone /&--recurse-submodules /g" /start.sh \
    -e "s/fastcgi_index index.php;/&\n\t\tfastcgi_read_timeout 1h;\n\t\tfastcgi_buffering off;/g" /etc/nginx/sites-available/default.conf

CMD ["/start.sh"]