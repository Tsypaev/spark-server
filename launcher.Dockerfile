FROM openjdk:8

EXPOSE 8080

ARG WORKDIR

COPY target/spark-server-1.0-SNAPSHOT-jar-with-dependencies.jar ${WORKDIR}/spark-server-1.0-SNAPSHOT-jar-with-dependencies.jar

CMD ["java","-jar","/tmp/spark-server-1.0-SNAPSHOT-jar-with-dependencies.jar"]

