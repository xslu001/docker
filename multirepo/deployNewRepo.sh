#!/bin/bash
dirname=$(dirname $0)

# custom deployment to / with redirect from /source
NEWREPO=$1
opengrok-deploy /opengrok/lib/source.war /usr/local/tomcat/webapps/${NEWREPO}.war -c /var/opengrok/${NEWREPO}/etc/configuration.xml
${dirname}/updateIndexHtml.sh > /usr/local/tomcat/webapps/ROOT/index.html



