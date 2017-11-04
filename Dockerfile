FROM openjdk:8-jdk-alpine
#FROM openjdk:8

VOLUME /tmp
EXPOSE 8090
ADD build/libs/demo-service-0.0.1-SNAPSHOT.jar app.jar
RUN sh -c 'touch /app.jar'
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
