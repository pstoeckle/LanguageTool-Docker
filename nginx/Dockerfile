FROM nginx:1.23.2

ARG COMMIT=""
ARG COMMIT_SHORT=""
ARG BRANCH=""
ARG TAG=""

LABEL author="Patrick Stöckle <patrick.stoeckle@tum.de>"
LABEL edu.tum.i4.language-tool.nginx.commit=${COMMIT}
LABEL edu.tum.i4.language-tool.nginx.commit-short=${COMMIT_SHORT}
LABEL edu.tum.i4.language-tool.nginx.branch=${BRANCH}
LABEL edu.tum.i4.language-tool.nginx.tag=${TAG}

ENV COMMIT=${COMMIT}
ENV COMMIT_SHORT=${COMMIT_SHORT}
ENV BRANCH=${BRANCH}
ENV TAG=${TAG}

RUN apt-get update -qq \
    && apt-get autoremove -y -qq \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /etc/nginx/conf.d \
    && mkdir -p /etc/nginx/conf.d

COPY conf.d /etc/nginx/conf.d
