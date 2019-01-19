#FROM debian:stable-slim as fetcher

#RUN apt-get -y update && apt-get install -y curl jq wget
#RUN ["/bin/bash", "-c", "set -o pipefail \
#     && curl -sS https://api.github.com/repos/oracle/opengrok/releases \
#     | jq -er '.[0].assets[]|select(.name|startswith(\"opengrok-1.1\"))|.browser_download_url' \
#     | wget --no-verbose -i - -O opengrok.tar.gz"]

FROM opengrok/docker:latest
MAINTAINER multirepo opengrok developer "xslu001@126.com"

ENV VAR_OPENGROK_ROOT /var/opengrok

ADD multirepo /multirepo
ENV PATH /multirepo:$PATH

RUN chmod -R +x /multirepo && \
    cp /multirepo/start.sh /scripts && \
    rm -rf /usr/local/tomcat/webapps/ROOT/* && \
    rm -rf /usr/local/tomcat/webapps/source && \
    rm -rf /usr/local/tomcat/webapps/source.war 

# run

