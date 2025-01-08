ARG IMAGE

# Imagem base
FROM $IMAGE

ARG APPLICATION_NAME
ARG CI_PROJECT_NAME
ARG PROJECT_PATH_JAR

# Configuração do workdir
WORKDIR /app

# Copiar o arquivo .jar gerado pelo stage:maven_project_build para o contêiner
COPY $PROJECT_PATH_JAR/target/$APPLICATION_NAME.jar /app/$CI_PROJECT_NAME.jar

# tonar aplica executável
RUN chmod +x /app/$CI_PROJECT_NAME.jar

# Expõe a porta 8080
EXPOSE 8080

# Comando padrão
CMD ["java", "-jar", /app/$CI_PROJECT_NAME.jar]
