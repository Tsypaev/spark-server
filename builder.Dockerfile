FROM maven:3.5.2-jdk-8-alpine

ARG WORKDIR

COPY pom.xml ${WORKDIR}/pom.xml
COPY src ${WORKDIR}/src

WORKDIR ${WORKDIR}

RUN mvn package

