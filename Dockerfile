FROM php:7.4-alpine

ENV PHPIZE_DEPS \
    autoconf \
    cmake \
    file \
    g++ \
    gcc \
    libc-dev \
    pcre-dev \
    make \
    git \
    pkgconf \
    re2c \
    # for GD
    freetype-dev \
    libpng-dev  \
    libjpeg-turbo-dev \
    # for zip extension
    libzip-dev \
    openssl-dev

RUN set -ex \
 && apk add --update --no-cache --virtual .persistent-deps \
    # for GD
    freetype \
    libpng \
    zlib \
    libjpeg-turbo \
    # for zip
    libzip \
    libgcrypt \
 && apk add --no-cache --virtual .build-deps $PHPIZE_DEPS \
 && docker-php-ext-configure gd \
      --enable-gd \
      --with-freetype=/usr/include/ \
      --with-jpeg=/usr/include/ \
 && docker-php-ext-install -j$(nproc) gd zip \
 && apk del .build-deps

WORKDIR /app
COPY . /app/

RUN set -ex \
 && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
 && php composer-setup.php\
 && php -r "unlink('composer-setup.php');" \
 && ./composer.phar install -a --no-dev --prefer-dist \
 && rm -rf composer.phar

ENTRYPOINT ["/app/entrypoint.sh"]
