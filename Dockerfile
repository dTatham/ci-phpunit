FROM php:7-alpine

RUN \
	apk --no-cache add libzip-dev composer php7-sodium $PHPIZE_DEPS && \
	docker-php-ext-configure zip --with-libzip && \
	docker-php-ext-install -j$(nproc) zip && \
	docker-php-ext-enable sodium && \
	pecl install xdebug && \
	docker-php-ext-enable xdebug && \
	apk del --purge $PHPIZE_DEPS && \
	composer selfupdate --clean-backups

ENV COMPOSER_ALLOW_SUPERUSER=1 COMPOSER_DISABLE_XDEBUG_WARN=1
