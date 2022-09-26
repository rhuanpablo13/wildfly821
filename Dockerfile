FROM alpine:latest

USER root

RUN apk update && \
    apk upgrade 
RUN apk add openjdk8

WORKDIR /app
RUN apk add --no-cache git
RUN apk add --no-cache openssh
RUN git clone https://github.com/rhuanpablo13/wildfly821.git

RUN mkdir -p /app/wildfly821/standalone/deployments

RUN ["chmod", "+x", "/app/wildfly821/bin/standalone.sh"]

RUN rm -rf /app/wildfly821/standalone/configuration/standalone_xml_history/current

EXPOSE 9990