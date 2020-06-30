


FROM ubuntu
#MAINTAINER sekhar1996
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk wget
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
RUN wget http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.23/bin/apache-tomcat-8.0.23.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvzf tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-8.0.23/* /opt/tomcat/
EXPOSE 5000
COPY target/*.war /opt/tomcat/webapps/exam-1.0.0.war
CMD /opt/tomcat/bin/catalina.sh run
