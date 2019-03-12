FROM dengrocrm/baseimage-alpine:latest
MAINTAINER dandengro
LABEL maintainer="dandengro"

RUN \
    # install runtime packages
    apk add --no-cache \
        apache2-utils \
        composer \
        git \
        libressl2.7-libssl \
        logrotate \
        nginx \
        nodejs \
        npm \
        mariadb-client \
        openssl \
        php7 \
        php7-cli \
        php7-common \
        php7-curl \
        php7-ctype \
        php7-dev \
        php7-dom \
        php7-fileinfo \
        php7-fpm \
        php7-gd \
        php7-intl \
        php7-json \
        php7-mbstring \
        php7-mcrypt \
        php7-opcache \
        php7-openssl \
        php7-pdo \
        php7-pdo_mysql \
        php7-pgsql \
        php7-session \
        php7-simplexml \
        php7-soap \
        php7-sqlite3 \
        php7-tokenizer \
        php7-xml \
        php7-xmlwriter \
        php7-xdebug \
        php7-zip \
        php7-zlib \
        yarn \
    # configure nginx
    && echo 'fastcgi_param  SCRIPT_FILENAME $document_root$fastcgi_script_name;' >> /etc/nginx/fastcgi_params \
    && rm -f /etc/nginx/conf.d/default.conf \
    # fix logrotate
    && sed -i "s#/var/log/messages {}.*# #g" /etc/logrotate.conf \
    # # cleanup
    && rm -rf \
        /tmp/*

# Copy local files
COPY root/ /

# Expose ports
EXPOSE 80 443

# Create config dir
VOLUME /config