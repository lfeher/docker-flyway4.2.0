FROM openjdk:8-jre

RUN adduser --system --home /flyway --disabled-password --group flyway
WORKDIR /flyway

USER flyway

ENV FLYWAY_VERSION 4.2.0

RUN curl -L https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/${FLYWAY_VERSION}/flyway-commandline-${FLYWAY_VERSION}.tar.gz -o flyway-commandline-${FLYWAY_VERSION}.tar.gz \
  && tar -xzf flyway-commandline-${FLYWAY_VERSION}.tar.gz --strip-components=1 \
  && rm flyway-commandline-${FLYWAY_VERSION}.tar.gz

COPY ojdbc6.jar ./drivers/
COPY wait-for-it.sh .

USER root
RUN chmod +x wait-for-it.sh

ENTRYPOINT ["/bin/sh"]
