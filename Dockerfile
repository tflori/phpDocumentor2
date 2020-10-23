FROM iras/php7-composer:1

WORKDIR /data
VOLUME /data

ADD . /opt/phpdoc

ENV PHPDOC_ENV=prod
ENV PATH="/opt/phpdoc/bin:${PATH}"
RUN cd /opt/phpdoc \
    && chmod +x bin/phpdoc \
    && composer install --prefer-dist -o --no-interaction --no-dev \
    && mkdir -p /opt/phpdoc/var \
    && chmod 777 /opt/phpdoc/var \
    && echo "memory_limit=-1" >> /etc/php7/conf.d/phpdoc.ini
