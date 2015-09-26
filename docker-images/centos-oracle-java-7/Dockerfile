# DOCKER-VERSION 1.2.0
# How to build:
# docker build --rm=true -t centos6/jdk7 .
#
# How to run:
# sudo docker run --rm=true -p 8080 -t -i --name tomcat7 centos6/tomcat7
#
# Running from outside container as user tomcat
# sudo docker run --rm=true -t -i --name tomcat7 centos6/tomcat7  /usr/bin/sudo -u tomcat /opt/tomcat7/bin/catalina.sh run 

FROM centos:centos6

ENV JDK_VERSION=jdk-7u79-linux-x64
ENV JDK_DIR=jdk1.7.0_79

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

ENV JAVA_HOME /opt/$JDK_DIR

ENV PATH=$PATH;$JAVA_HOME/bin


