# DOCKER-VERSION 1.2.0
# How to build:
# docker build --rm=true -t jdk7/tomcat7 .
#
# How to run:
# sudo docker run --rm=true -p 8080 -t -i --name tomcat7 centos6/tomcat7
#
# Running from outside container as user tomcat
# sudo docker run --rm=true -t -i --name tomcat7 centos6/tomcat7  /usr/bin/sudo -u tomcat /opt/tomcat7/bin/catalina.sh run 

FROM centos6/jdk7

ENV TOMCAT_VERSION=7.0.64

# Install WGET
RUN yum install -y wget

# Install tar
RUN yum install -y tar

# Download Apache Tomcat 7 and move to proper location
RUN cd /tmp \
	&& wget http://apache.xfree.com.ar/tomcat/tomcat-7/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz \
	&& /bin/tar xvf apache-tomcat-$TOMCAT_VERSION.tar.gz \
	&& /bin/mv apache-tomcat-$TOMCAT_VERSION /opt/tomcat7

#COPY src/main/settings/tomcat-users.xml /opt/tomcat7/conf/

RUN /bin/chmod -R 755 /opt/tomcat7

RUN /usr/sbin/groupadd -r tomcat && /usr/sbin/useradd -r -g tomcat tomcat
RUN /bin/chown -Rf tomcat.tomcat /opt/tomcat7

EXPOSE 8080

CMD /opt/tomcat7/bin/catalina.sh run


