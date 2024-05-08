FROM openjdk:11-jre-stretch

ARG DEPLOY_NAME_TEMP
ARG DEPLOY_NAME_FINAL
ARG PROJECT_PATH_JAR

ENV LANG en_US.ISO-8859-1
ENV PATH_FACHESF_PROPERTIES=/etc/fachesf

WORKDIR /app

COPY $PROJECT_PATH_JAR/target/$DEPLOY_NAME_TEMP.jar /app/$DEPLOY_NAME_FINAL.jar

RUN chmod +x /app/$DEPLOY_NAME_FINAL.jar

EXPOSE 8080

CMD ["bash", "-c", "java -jar /app/$DEPLOY_NAME_FINAL.jar"]
