FROM node:lts-alpine

RUN npm install -g http-server

WORKDIR /app

COPY package*.json ./

RUN npm install	&& \
    npm install moment --save && \
    npm install vue-localstorage --save &&\
    npm install vue-cookies --save

COPY app .

RUN npm run build

EXPOSE 8080

CMD [ "http-server", "dist" ]
