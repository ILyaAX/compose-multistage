FROM maven:3.8-openjdk-8 as builder
RUN apt update
RUN git clone https://github.com/shephertz/App42PaaS-Java-MySQL-Sample.git /home
COPY ./Config.properties /home/WebContent/Config.properties
RUN mvn package -f /home/

FROM tomcat:8.0-alpine
COPY --from=builder /home/target/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps
COPY ./Config.properties /usr/local/tomcat/webapps/ROOT/Config.properties