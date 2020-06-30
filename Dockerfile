
FROM centos

MAINTAINER adisekharraju@gmail.com
RUN mkdir /opt/tomcat/

RUN cd /opt/tomcat
RUN yum -y update
RUN yum -y install wget
RUN wget https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.40/bin/apache-tomcat-8.5.40.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.40/* /opt/tomcat/.
RUN yum -y install java
RUN java -version


EXPOSE 5000
COPY target/*.war /opt/tomcat/webapps/exam-1.0.0.war
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
