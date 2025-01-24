FROM nginx:latest

# Argumentos para o build
ARG APPLICATION_NAME
ARG APPLICATION_PATH

# Define o valor de ambiente para uso com envsubst
ENV APPLICATION_PATH=$APPLICATION_PATH

# Copia o arquivo de configuração do Nginx previamente formatado
COPY nginx.template /etc/nginx/conf.d/nginx.template

# Substitui as variáveis de ambiente no arquivo de configuração
RUN envsubst '$APPLICATION_PATH' < /etc/nginx/conf.d/nginx.template > /etc/nginx/conf.d/default.conf

# Copia os arquivos do build da aplicação para o diretório correto
COPY $APPLICATION_NAME/ /usr/share/nginx/html/$APPLICATION_PATH/

EXPOSE 80

# Inicia o Nginx
CMD ["nginx", "-g", "daemon off;"]
