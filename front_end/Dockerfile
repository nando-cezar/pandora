# Use uma imagem base do Dart
FROM dart:stable AS build

# Defina o diretório de trabalho
WORKDIR /app

# Instale o Flutter
RUN apt-get update && \
    apt-get install -y git curl unzip xz-utils && \
    git clone https://github.com/flutter/flutter.git -b stable /flutter && \
    /flutter/bin/flutter doctor

# Adicione o Flutter ao PATH
ENV PATH="/flutter/bin:/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Copie os arquivos do projeto para o contêiner
COPY . .

# Instale as dependências do Flutter
RUN flutter pub get

# Construa a aplicação Flutter Web
RUN flutter build web

# Use uma imagem base para o servidor web
FROM nginx:alpine

# Copie os arquivos gerados pela build para o diretório do Nginx
COPY --from=build /app/build/web /usr/share/nginx/html

# Exponha a porta 80 para o servidor web
EXPOSE 80

# Inicie o Nginx
CMD ["nginx", "-g", "daemon off;"]
