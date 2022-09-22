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

#RUN ["rm", "-rf", "/app/wildfly821/standalone/configuration/standalone_xml_history/current/*"]
#RUN ["chown", "-R", "root:root",  "/app/wildfly821/"]


#RUN ["chmod", "-R", "777", "/app/wildfly821/standalone"]

RUN rm -rf /app/wildfly821/standalone/configuration/standalone_xml_history/current

#RUN chmod 777 /app/wildfly821/standalone/configuration/standalone_xml_history/*

#CMD ["/app/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]

EXPOSE 9990