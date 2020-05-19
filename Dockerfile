FROM alpine:3.11

LABEL maintainer="David Boenig <dave@martial.sh>"
LABEL repository="https://github.com/martialonline/docker-ansible-azure"

ENV ANSIBLE_VERSION=2.9.9

RUN apk --update --no-cache add \
  ca-certificates \
  git \
  openssh-client \
  openssl \
  python3\
  zsh \
  util-linux

RUN apk --update add --virtual .build-deps \
  python3-dev \
  libffi-dev \
  openssl-dev \
  build-base && \
  pip3 install --upgrade \
  pip \
  cffi && \
  pip3 install ansible[azure]==${ANSIBLE_VERSION} jinja2 && \
  apk del .build-deps && \
  rm -rf /var/cache/apk/*