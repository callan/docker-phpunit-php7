FROM php:7-cli
MAINTAINER Chris Allan <chris@allan.codes>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -yqq \
    && apt-get install git zlib1g-dev -y \
    && docker-php-ext-install zip \
    && docker-php-ext-install pdo_mysql \
    && curl -fsSL https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && composer global require phpunit/phpunit \
    && pecl install xdebug \
    && echo 'zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20151012/xdebug.so' > \
        /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

ENV PATH /root/.composer/vendor/bin:$PATH
CMD ["phpunit"]
