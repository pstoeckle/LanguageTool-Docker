FROM nginx:1.23.2

LABEL author="Patrick Stöckle <patrick.stoeckle@tum.de>"

RUN apt-get update -qq \
    && apt-get autoremove -y -qq \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /etc/nginx/conf.d \
    && useradd --create-home --shell /bin/bash nginx-user-unpriv \
    && mkdir -p /etc/nginx/conf.d \
    && chown -R nginx-user-unpriv /etc/nginx/conf.d \
    && chown -R nginx-user-unpriv /var/cache/nginx

COPY nginx.conf /etc/nginx/nginx.conf

ARG HOST_NAME

RUN sed -i "s/HOST_NAME_PLACEHOLDER/${HOST_NAME}/g" /etc/nginx/nginx.conf \
    && chmod 444 /etc/nginx/nginx.conf 

USER nginx-user-unpriv
