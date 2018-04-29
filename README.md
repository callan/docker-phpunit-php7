# PHP7.X - PHPUNIT Docker

A series of docker files with different things for working with Composer, PHPUnit, XDebug (where available),
Sqlite3, and MySQL to make CI/CD a little easier.

Intended for usage in a CI environment (Travis, Gitlab, Drone, etc.):
 - PHP7 (based off the [official](https://hub.docker.com/_/php/) PHP Docker)
 - XDebug (Latest through PECL, only for 7.0, 7.1, and 7.2)
 - Composer (Latest through installer)
 - PHPUnit (5.x, 6.x, and 7.x depending on docker tags, through composer)

The docker hub page can be found here:
[epcallan/php7-testing-phpunit](https://hub.docker.com/r/epcallan/php7-testing-phpunit/)

## Tags And Options

 - `7.2-phpunit7`: PHP7.2, PHPUnit 7.x, XDebug
 - `7.2-phpunit6`: PHP7.2, PHPUnit 6.x, XDebug
 - `7.2-phpunit5`: PHP7.2, PHPUnit 5.x, XDebug
 - `7.1-phpunit7`: PHP7.1, PHPUnit 7.x, XDebug
 - `7.1-phpunit6`: PHP7.1, PHPUnit 6.x, XDebug
 - `7.1-phpunit5`: PHP7.1, PHPUnit 5.x, XDebug
 - `7.0-phpunit6`: PHP7.0, PHPUnit 6.x, XDebug
 - `7.0-phpunit5`: PHP7.0, PHPUnit 5.x, XDebug

## Usage

### Command Line
```
docker pull epcallan/php7-testing-phpunit:7.1-phpunit5
```

### Drone
```
build:
  image: epcallan/php7-testing-phpunit:7.1-phpunit5
  commands:
    - composer install
    - phpunit
```

### Gitlab
```
image: epcallan/php7-testing-phpunit:7.1-phpunit5

before_script:
  - composer install

in_docker:
  stage: test
  script:
    - phpunit
  only:
    - master
```

## Building Additions Yourself

If you want to add Postgres or ODBC or another PHP extension to the mix, simply clone this repository and add the additions into any of the `Dockerfile`'s and then build them (for example: `docker build php7.1-phpunit6`).

If you'd like to see this enable a basic extension, feel free to submit an issue.

## Copyright

MIT Licensed. For complete license, see `LICENSE`
