FROM php:7-cli
MAINTAINER Chris Allan <chris@allan.codes>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -yqq \
    && apt-get install git zlib1g-dev -y \
    && docker-php-ext-install zip \
    && curl -fsSL https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && composer global require phpunit/phpunit

CMD ["php", "-a"]
