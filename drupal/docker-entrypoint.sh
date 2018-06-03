#!/bin/sh -ex

while ! mysqladmin ping -h "drupal-db" -u drupal -pdrupal --silent; do
    sleep 1
done

drush si standard \
  --db-url=mysql://drupal:drupal@drupal-db/drupal \
  -n -y \
  --account-name drupal \
  --account-pass drupal368

docker-php-entrypoint php-fpm