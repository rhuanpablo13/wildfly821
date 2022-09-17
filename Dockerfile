FROM alpine:latest

RUN apk update && \
    apk upgrade 
RUN apk add openjdk8

WORKDIR /app
RUN apk add --no-cache git
RUN apk add --no-cache openssh
RUN git clone https://github.com/rhuanpablo13/wildfly.git

RUN ["chmod", "+x", "/app/wildfly/bin/standalone.sh"]
CMD ["/app/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
