FROM node:lts-alpine

RUN npm install -g http-server

WORKDIR /app

COPY package*.json ./

RUN npm install		&& \
    npm install --save moment

COPY app .

RUN npm run build

EXPOSE 8080

RUN chmod +x ./entrypoint.sh

CMD [ "http-server", "dist" ]
