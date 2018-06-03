FROM drupal:8-fpm-alpine

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
    apk add --no-cache git mysql-client && \
    wget -O drush.phar https://github.com/drush-ops/drush-launcher/releases/download/0.6.0/drush.phar && \
    chmod +x drush.phar && \
    mv drush.phar /usr/local/bin/drush && \
    composer require drush/drush && \
    chown -R www-data:www-data /var/www/html

USER www-data

COPY ./docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
