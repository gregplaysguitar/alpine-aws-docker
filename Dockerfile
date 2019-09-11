# source version
# https://alpinelinux.org/
FROM alpine:3.10

# pkg and pip installs
RUN apk update && \
	apk add --no-cache \
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
        openssh \
        make && \
    ln -s locale.h /usr/include/xlocale.h && \
    apk add --no-cache --virtual .build-deps \
        python3-dev \
        libffi-dev \
        openssl-dev \
        g++ && \
    pip3 install --upgrade pip setuptools && \
    pip3 install --no-cache-dir \
        "urllib3<1.25,>=1.21.1" \
        "PyYAML<4.3,>=3.10" \
        awscli \
        docker-compose

# ecs-cli install
RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest
RUN chmod +x /usr/local/bin/ecs-cli