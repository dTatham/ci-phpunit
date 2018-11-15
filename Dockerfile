FROM php:7-alpine

RUN \
	apk --no-cache add libzip-dev composer php7-sodium php7-xdebug && \
	docker-php-ext-configure zip --with-libzip && \
	docker-php-ext-install -j$(nproc) zip && \
	docker-php-ext-enable sodium

ENV OMPOSER_ALLOW_SUPERUSER=1 COMPOSER_DISABLE_XDEBUG_WARN: 1
