FROM alpine:3.11

LABEL maintainer="David Boenig <dave@martial.sh>"
LABEL repository="https://github.com/martialonline/docker-ansible-azure"

ENV ANSIBLE_VERSION=2.9.9

RUN apk --update --no-cache add \
    ca-certificates \
    curl \
    git \
    openssh-client \
    openssl \
    python3 \
    util-linux \
    zsh

RUN apk --update add --virtual .build-dependencies \
    build-base && \
    libffi-dev \
    openssl-dev \
    python3-dev \
    pip3 install --upgrade \
    pip \
    cffi && \
    pip3 install ansible[azure]==${ANSIBLE_VERSION} jinja2 && \
    apk del .build-dependencies && \
    rm -rf /var/cache/apk/*

CMD [ "ansible-playbook", "--version" ]