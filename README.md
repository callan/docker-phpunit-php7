# PHP7 - PHPUNIT Docker

A Dockerfile to have the following components ready-to-go
without having to install them.

Intended for usage in a CI environment (Drone/Gitlab/etc.):
 - PHP7 (based off the [official](https://hub.docker.com/_/php/) PHP Docker, using `php:7-cli`)
 - XDebug (Latest through PECL)
 - Composer (Latest through installer)
 - PHPUnit (Latest through Composer)
