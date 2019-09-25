FROM node:lts-alpine

RUN npm install -g http-server

WORKDIR /app

COPY app/package*.json ./

RUN npm install	&& npm audit fix            && \
    npm install moment --save               && \
    npm install vue-localstorage --save     &&\
    npm install vue-cookies --save          && \
    npm install --save apexcharts           && \
    npm install --save vue-apexcharts

COPY app .

RUN npm run build

EXPOSE 8080

CMD [ "http-server", "dist" ]