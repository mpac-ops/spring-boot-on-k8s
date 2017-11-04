FROM openjdk:8-jdk-alpine
#FROM openjdk:8

ADD target/spring-boot-on-k8s-1.0-SNAPSHOT.jar /opt/demo/demo-1.0.jar
CMD ["java","-jar","/opt/demo/demo-1.0.jar"]
