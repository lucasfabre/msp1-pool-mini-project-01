FROM node:lts-alpine

WORKDIR /app

RUN apt-get update                                                      && \
    apt-get install -y build-essential inotify-tools                    && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash -             && \
    apt-get install -y nodejs                                           && \
    npm install -g http-server

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 8080

RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "/api/entrypoint.sh" ]
