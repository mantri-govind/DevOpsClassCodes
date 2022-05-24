FROM tomcat:latest
LABEL maintainer="Govind Mantri"
ADD ./target/addressbook.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
