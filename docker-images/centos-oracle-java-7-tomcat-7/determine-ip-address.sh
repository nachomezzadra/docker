#/bin/bash

docker inspect --format '{{ .NetworkSettings.IPAddress }}' tomcat7
