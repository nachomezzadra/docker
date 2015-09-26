# DOCKER-VERSION 1.2.0
# How to build:
# docker build --rm=true -t centos6/tomcat7 .
#
# How to run:
# sudo docker run --rm=true -p 8080 -t -i --name tomcat7 centos6/tomcat7
#
# Running from outside container as user tomcat
# sudo docker run --rm=true -t -i --name tomcat7 centos6/tomcat7  /usr/bin/sudo -u tomcat /opt/tomcat7/bin/catalina.sh run 

FROM centos:centos6

ENV JDK_VERSION=jdk-7u79-linux-x64
ENV JDK_DIR=jdk1.7.0_79
ENV TOMCAT_VERSION=7.0.64

# Install WGET
RUN yum install -y wget

# Install tar
RUN yum install -y tar

# Install sudo
RUN yum -y install sudo

# Download JDK
RUN cd /opt;wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u79-b15/$JDK_VERSION.tar.gz


# gunzip JDK
RUN cd /opt;gunzip $JDK_VERSION.tar.gz
RUN cd /opt;tar xvf $JDK_VERSION.tar
RUN alternatives --install /usr/bin/java java /opt/$JDK_DIR/bin/java 2

# Download Apache Tomcat 7
RUN cd /tmp;wget http://apache.xfree.com.ar/tomcat/tomcat-7/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz


# untar and move to proper location
RUN cd /tmp;gunzip apache-tomcat-$TOMCAT_VERSION.tar.gz
RUN cd /tmp;tar xvf apache-tomcat-$TOMCAT_VERSION.tar
RUN cd /tmp;mv apache-tomcat-$TOMCAT_VERSION /opt/tomcat7

COPY src/main/settings/tomcat-users.xml /opt/tomcat7/conf/

RUN chmod -R 755 /opt/tomcat7

RUN groupadd tomcat
RUN useradd -s /bin/bash -g tomcat tomcat
RUN chown -Rf tomcat.tomcat /opt/tomcat7

ENV JAVA_HOME /opt/$JDK_DIR
EXPOSE 8080

CMD /opt/tomcat7/bin/catalina.sh run


