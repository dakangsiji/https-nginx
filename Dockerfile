FROM nginx

MAINTAINER Edward Lee <freesky.edward@gmail.com>

RUN apt-get update && \
    apt install curl -y && \
    apt-get install git -y && \
    apt-get install -y inotify-tools

ENV HUGO_VERSION=0.56.3

RUN mkdir -p /usr/local/src && \
    cd /usr/local/src && \
    curl -L https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz | tar -xz && \
    mv hugo /usr/local/bin/

RUN mkdir -p /src/ && \
    cd /src/ && \
    git clone https://gitee.com/openeuler/website && \
    git clone https://gitee.com/openeuler/docs && \
    rm -rf /src/website/content/docs/ && \
    rm -rf /src/website/content/menu/ && \
    mkdir -p /src/website/content/docs/ && \
    mkdir -p /src/website/content/menu/ && \
    cp -rf /src/docs/content/docs/* /src/website/content/docs/ && \
    cp -rf /src/docs/content/menu/* /src/website/content/menu/ && \
    cd /src/website && /usr/local/bin/hugo -b / && \
    cp -rf /src/website/public/* /usr/share/nginx/html/ && \
    chmod -R 755 /usr/share/nginx/html

COPY index2.html /usr/share/nginx/html/index2.html
RUN chmod +r /usr/share/nginx/html/index2.html
COPY auto-reload-nginx.sh /home/auto-reload-nginx.sh
RUN chmod +x /home/auto-reload-nginx.sh

ENV RUN_USER nginx
ENV RUN_GROUP nginx
EXPOSE 80
ENTRYPOINT nginx -g "daemon off;"
