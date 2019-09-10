# source version
# https://alpinelinux.org/
FROM alpine:3.10

# pkg and pip installs
RUN apk -v --update add \
        bash \
        git \
        zip \
        unzip \
        openssh \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        curl \
        docker \
        jq \
        rsync \
        && \
    pip install awscli && \
    pip install docker-compose && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*

# ecs-cli install
RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest
RUN chmod +x /usr/local/bin/ecs-cli