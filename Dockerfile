FROM tomcat:8.0

COPY target/thv.jar /usr/local/tomcat/lib/
COPY conf/context.xml /usr/local/tomcat/conf/

EXPOSE 8080
