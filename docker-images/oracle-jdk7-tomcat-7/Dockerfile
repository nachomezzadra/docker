# Dockerfile for Tomcat 7
#
# How to build:
# docker build --rm=true -t jdk7/tomcat7 .
#
# How to run:
# sudo docker run -d -p 8080:8080 -t -i --name tomcat7 -v /home/imezzadra/workspace/docker/docker-images/webapps/:/opt/tomcat/webapps jdk7/tomcat7

FROM centos6/jdk7

ENV TOMCAT_VERSION=7.0.64
ENV TOMCAT_HOME /opt/tomcat

# Install WGET
RUN yum install -y wget

# Install tar
RUN yum install -y tar

# Download Apache Tomcat 7 and move to proper location
RUN cd /tmp \
	&& wget http://apache.xfree.com.ar/tomcat/tomcat-7/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz \
	&& /bin/tar xvf apache-tomcat-$TOMCAT_VERSION.tar.gz \
	&& /bin/mv apache-tomcat-$TOMCAT_VERSION $TOMCAT_HOME

#COPY src/main/settings/tomcat-users.xml /opt/tomcat7/conf/

RUN /bin/chmod -R 755 $TOMCAT_HOME

RUN /usr/sbin/groupadd -r tomcat && /usr/sbin/useradd -r -g tomcat tomcat
RUN /bin/chown -Rf tomcat.tomcat $TOMCAT_HOME

# Setting external volume so we can externally deploy our app/s 
VOLUME $TOMCAT_HOME/webapps

# Setting external volume so we can get the logs
VOLUME $TOMCAT_HOME/logs

WORKDIR $TOMCAT_HOME

# Exposing default tomcat port
EXPOSE 8080

# Launch Tomcat
CMD ["bin/catalina.sh", "run"]

