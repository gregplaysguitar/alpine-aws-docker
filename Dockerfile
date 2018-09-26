FROM alpine:3.6

# install awscli, docker, curl
RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        curl \
        docker \
        && \
    pip install awscli && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*

# install ecs-cli
RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest
RUN chmod +x /usr/local/bin/ecs-cli
