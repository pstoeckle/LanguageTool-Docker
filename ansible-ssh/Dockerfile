FROM alpine:3.16.2

ARG COMMIT=""
ARG COMMIT_SHORT=""
ARG BRANCH=""
ARG TAG=""

LABEL author="Patrick Stöckle <patrick.stoeckle@tum.de>"
LABEL edu.tum.i4.language-tool.ansible-ssh.commit=${COMMIT}
LABEL edu.tum.i4.language-tool.ansible-ssh.commit-short=${COMMIT_SHORT}
LABEL edu.tum.i4.language-tool.ansible-ssh.branch=${BRANCH}
LABEL edu.tum.i4.language-tool.ansible-ssh.tag=${TAG}

ENV COMMIT=${COMMIT}
ENV COMMIT_SHORT=${COMMIT_SHORT}
ENV BRANCH=${BRANCH}
ENV TAG=${TAG}

RUN apk update \
    && apk add ansible openssh \
    && addgroup -S ci-group \
    && adduser -S ci-user -G ci-group

WORKDIR /home/ci-user
USER ci-user
