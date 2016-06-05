# PHP7 - PHPUNIT Docker

A Dockerfile to have the following components ready-to-go
without having to install them.

Intended for usage in a CI environment (Drone/Gitlab/etc.):
 - PHP7 (based off the [official](https://hub.docker.com/_/php/) PHP Docker, using `php:7-cli`)
 - XDebug (Latest through PECL)
 - Composer (Latest through installer)
 - PHPUnit (Latest through Composer)

The docker hub page can be found here:
[hub.docker.com/r/epcallan/phpunit-php7](https://hub.docker.com/r/epcallan/phpunit-php7/)

## Usage

### Command Line
```
docker pull epcallan/phpunit-php7
```

### Drone
```
build:
  image: epcallan/phpunit-php7
  commands:
    - composer install
    - phpunit
```

### Gitlab
```
image: epcallan/phpunit-php7

before_script:
  - php composer.phar install --no-progress --no-plugins -o

in_docker:
  stage: test
  script:
    - phpunit
  only:
    - master
```
