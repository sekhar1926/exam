
FROM centos

MAINTAINER adisekharraju@gmail.com
RUN mkdir /opt/tomcat/

RUN cd /opt/tomcat
RUN yum -y update
RUN yum -y install wget
RUN wget https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.99/bin/apache-tomcat-7.0.99.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-7.0.99/* /opt/tomcat/.
RUN yum -y install java
RUN java -version


EXPOSE 5000
COPY target/*.war /opt/tomcat/webapps/exam-1.0.0.war
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
