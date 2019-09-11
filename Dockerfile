# source version
# https://alpinelinux.org/
# https://github.com/docker-library/python/blob/master/3.7/alpine3.10/Dockerfile
FROM python:3.7-alpine

# pkg and pip installs
RUN apk update
RUN apk add --no-cache \
        bash \
        git \
        zip \
        unzip \
        curl \
        jq \
        less \
        groff \
        mailcap \
        docker \
        rsync \
        openssh-client \
        make \
    && ln -s locale.h /usr/include/xlocale.h \
    && apk add --no-cache --virtual .build-deps \
        build-base \
        libffi-dev \
        openssl-dev \
        g++ \
    && pip3 install --upgrade pip setuptools \
    && pip3 install --no-cache-dir \
        "urllib3<1.25,>=1.21.1" \
        "PyYAML<4.3,>=3.10" \
        awscli \
        docker-compose \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*

# ecs-cli install
RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest
RUN chmod +x /usr/local/bin/ecs-cli