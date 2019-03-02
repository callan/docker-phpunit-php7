FROM php:7.3-cli
MAINTAINER Chris Allan <chris@allan.codes>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -yqq \
    && apt-get install git libzip-dev zlib1g-dev libsqlite3-dev -y \
    && docker-php-ext-install zip \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install pdo_sqlite

RUN curl -fsSL https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && composer global require phpunit/phpunit ^7.0 --no-progress --no-scripts --no-interaction

# only xdebug-2.7.0beta1 supports php 7.3 for now
RUN pecl install xdebug-2.7.0beta1 && docker-php-ext-enable xdebug

ENV PATH /root/.composer/vendor/bin:$PATH
CMD ["phpunit"]
