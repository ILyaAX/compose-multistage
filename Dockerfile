FROM maven:3.8-openjdk-8
RUN apt update
RUN git clone https://github.com/shephertz/App42PaaS-Java-MySQL-Sample.git /home
COPY ./Config.properties /home/WebContent/Config.properties
RUN mvn package -f /home/