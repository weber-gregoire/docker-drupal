FROM drupal:8-fpm-alpine

USER  www-data

RUN   mkdir -p /var/www/html/sites/default/files && \
        cp /var/www/html/sites/default/default.settings.php /var/www/html/sites/default/settings.php

USER  root