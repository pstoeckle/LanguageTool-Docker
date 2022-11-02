FROM alpine:3.16.2

RUN apk update \
    && apk add ansible openssh \
    && addgroup -S ci-group \
    && adduser -S ci-user -G ci-group

WORKDIR /home/ci-user
USER ci-user
