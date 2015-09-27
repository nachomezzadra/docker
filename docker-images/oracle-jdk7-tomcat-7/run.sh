#/bin/bash

sudo docker run -d -p 8080:8080 -t -i --name tomcat7 -v /home/imezzadra/workspace/docker/docker-images/webapps/:/opt/tomcat/webapps jdk7/tomcat7
