FROM alpine:3.6

# install awscli, docker, docker-compose, curl
# awscli and docker-compose installed separately because the latter has a stricter dep requirement on urllib3
RUN apk -v --update add \
        bash \
        git \
        openssh \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        curl \
        docker \
        jq \
        && \
    pip install awscli && \
    pip install docker-compose && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*

# install ecs-cli
RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest
RUN chmod +x /usr/local/bin/ecs-cli
