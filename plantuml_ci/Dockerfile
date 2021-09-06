FROM openjdk:14-jdk-alpine3.10
ENV PLANTUML_VERSION=1.2021.10
ARG PAT=1
RUN echo $PAT
RUN \
    apk update && \
    apk add --no-cache graphviz git wget ca-certificates ttf-dejavu fontconfig && \
    apk add --no-cache bash && \
    wget "http://downloads.sourceforge.net/project/plantuml/${PLANTUML_VERSION}/plantuml.${PLANTUML_VERSION}.jar" -O plantuml.jar && \
    apk del wget ca-certificates
COPY . .

RUN ["chmod", "+x", "./processdiagram.sh"]
RUN ./processdiagram.sh
CMD ["/bin/bash"]