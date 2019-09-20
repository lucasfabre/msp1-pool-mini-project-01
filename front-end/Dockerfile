FROM nginx:stable-alpine as production-stage

WORKDIR /app

COPY package*.json ./

RUN apt-get update                                                      && \
    apt-get install -y build-essential inotify-tools                    && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash -             && \
    apt-get install -y nodejs 						&& \
    npm install								&& \
    npm install --save moment

COPY app .

RUN npm run build

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
