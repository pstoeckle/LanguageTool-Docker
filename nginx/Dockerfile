FROM nginx:1.23.2

RUN apt-get update -qq \
    && apt-get autoremove -y -qq \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /etc/nginx/conf.d \
    && mkdir -p /etc/nginx/conf.d

COPY conf.d /etc/nginx/conf.d
