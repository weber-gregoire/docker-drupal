#!/bin/sh -ex

if [[ "$1" == start ]]; then

  if [ ! -f .installed ]; then
    echo "Drupal is not installed yet."

    if [ -z "${MYSQL_HOST}" ]; then
      echo "Environment variable MYSQL_HOST is needed."
      exit 1
    fi

    if [ -z "${MYSQL_DATABASE}" ]; then
      echo "Environment variable MYSQL_DATABASE is needed."
      exit 1
    fi

    if [ -z "${MYSQL_USER}" ]; then
      echo "Environment variable MYSQL_USER is needed."
      exit 1
    fi

    if [ -z "${MYSQL_PASSWORD}" ]; then
      echo "Environment variable MYSQL_PASSWORD is needed."
      exit 1
    fi

    if [ -z "${ADMIN_USERNAME}" ]; then
      echo "Environment variable ADMIN_USERNAME is needed."
      exit 1
    fi

    if [ -z "${ADMIN_PASSWORD}" ]; then
      echo "Environment variable ADMIN_PASSWORD is needed."
      exit 1
    fi

    while ! mysqladmin ping -h "$MYSQL_HOST" -u $MYSQL_USER -p$MYSQL_PASSWORD --silent; do
        sleep 1
    done

    drush si standard \
      --db-url=mysql://$MYSQL_USER:$MYSQL_PASSWORD@$MYSQL_HOST/$MYSQL_DATABASE \
      -n -y \
      --account-name $ADMIN_USERNAME \
      --account-pass $ADMIN_PASSWORD

    touch .installed
  fi

  docker-php-entrypoint php-fpm

else
  echo "Specify command to run on startup"
fi
